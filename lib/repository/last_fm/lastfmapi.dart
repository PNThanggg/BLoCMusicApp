import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'models/scrobble_track.dart';

class LastFmAPI {
  static String? apiKey;
  static String? apiSecret;
  static String? sessionKey;
  static String? username;
  static bool initialized = false;
  static const String apiUrl = 'http://ws.audioscrobbler.com/2.0/';
  static const String userStation = "https://www.last.fm/player/station/user/";
  static const Map<String, String> userStationEndpoints = {
    "recommended": "/recommended",
    "mix": "/mix",
    "library": "/library",
  };

  // Private constructor
  LastFmAPI._internal() {
    initialize(
      apiKey: null,
      apiSecret: null,
      sessionKey: null,
    );
  }

  // Singleton instance
  static final LastFmAPI _instance = LastFmAPI._internal();

  // Factory constructor to return the singleton instance
  factory LastFmAPI() {
    initialize(
      apiKey: null,
      apiSecret: null,
      sessionKey: null,
    );
    return _instance;
  }

  static void initialize({
    required String? apiKey,
    required String? apiSecret,
    required String? sessionKey,
  }) {
    apiKey = apiKey;
    apiSecret = apiSecret;
    sessionKey = sessionKey;

    if (apiKey != null && apiSecret != null && sessionKey != null) {
      initialized = true;
    }
  }

  static void setAPIKey(String apikey) {
    if (apikey.isNotEmpty) {
      apiKey = apikey;
    }
  }

  static void setAPISecret(String apisecret) {
    if (apisecret.isNotEmpty) {
      apiSecret = apisecret;
    }
  }

  static void setSession(String session) {
    if (session.isNotEmpty) {
      sessionKey = session;
    }
  }

  static void setUsername(String name) {
    if (name.isNotEmpty) {
      username = name;
    }
  }

  static String generateApiSig(Map<String, String> params, String apiSecret) {
    List<String> sortedParams = params.keys.toList()..sort();
    String sortedParamsString = sortedParams.map((key) => '$key${params[key]}').join();
    String signature = md5.convert(utf8.encode('$sortedParamsString$apiSecret')).toString();
    return signature;
  }

  static Future<bool> scrobble(List<ScrobbleTrack> tracks) async {
    if (apiKey == null || apiSecret == null || sessionKey == null) {
      throw Exception("LastFM API not initialized.");
    }
    if (tracks.length > 50) {
      throw Exception("Cannot scrobble more than 50 tracks at once.");
    }

    Map<String, String> params = {
      'method': 'track.scrobble',
      'api_key': apiKey!,
      'sk': sessionKey!,
    };

    for (int i = 0; i < tracks.length; i++) {
      params.addAll(tracks[i].toParams(i));
    }

    params['api_sig'] = generateApiSig(params, apiSecret!);
    params['format'] = 'json';
    final response = await http.post(Uri.parse(apiUrl), body: params);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey('scrobbles')) {
        Map<String, dynamic> scrobblesInfo = data['scrobbles'];
        final accepted = scrobblesInfo['@attr']['accepted'];
        final ignored = scrobblesInfo['@attr']['ignored'];

        log('Accepted Scrobbles: $accepted, Ignored Scrobbles: $ignored', name: 'LastFM API');
        return true;
      } else {
        String errorMessage = data['message'] ?? 'Unknown Error';
        log('Error: Response status not ok - $errorMessage', name: 'LastFM API');
      }
    } else {
      log('HTTP Error: ${response.statusCode} - ${response.body}', name: 'LastFM API');
    }

    return false;
  }

  static Future<String> fetchRequestToken() async {
    if (apiKey == null || apiSecret == null) {
      throw Exception("LastFM API not initialized.");
    }

    Map<String, String> params = {
      'method': 'auth.getToken',
      'api_key': apiKey!,
    };
    params['api_sig'] = generateApiSig(params, apiSecret!);
    params['format'] = 'json';

    try {
      final response = await http.get(Uri.http('ws.audioscrobbler.com', '/2.0/', params));
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData.containsKey('token')) {
        return responseData['token'];
      } else {
        throw Exception('Failed to retrieve authentication token');
      }
    } catch (e) {
      log('Error fetching request token: $e', name: 'LastFM API');
      rethrow;
    }
  }

  static String getAuthUrl(String token) {
    if (apiKey == null) {
      throw Exception("LastFM API not initialized.");
    }
    return 'http://www.last.fm/api/auth/?api_key=$apiKey&token=$token';
  }

  static Future<Map<String, String>> fetchSessionKey(String token) async {
    if (apiKey == null || apiSecret == null) {
      throw Exception("LastFM API not initialized.");
    }

    Map<String, String> params = {
      'method': 'auth.getSession',
      'api_key': apiKey!,
      'token': token,
    };
    params['api_sig'] = generateApiSig(params, apiSecret!);
    params['format'] = 'json';

    try {
      final response = await http.get(Uri.https('ws.audioscrobbler.com', '/2.0/', params));
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData.containsKey('session')) {
        setSession(responseData['session']['key']);
        setUsername(responseData['session']['name']);
        initialized = true;
        return {
          'name': responseData['session']['name'],
          'key': responseData['session']['key'],
        };
      } else {
        throw Exception('Failed to retrieve session key');
      }
    } catch (e) {
      log('Error fetching session key: $e', name: 'LastFM API');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getUserRecommendedList() async {
    if (apiKey == null || username == null) {
      throw Exception("LastFM API not initialized.");
    }
    final url = "$userStation$username${userStationEndpoints['recommended']}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user recommended list');
    }
  }

  static Future<Map<String, dynamic>> getUserMixList() async {
    if (apiKey == null || username == null) {
      throw Exception("LastFM API not initialized.");
    }
    final url = "$userStation$username${userStationEndpoints['mix']}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user mix list');
    }
  }

  static Future<Map<String, dynamic>> getUserLibraryList() async {
    if (apiKey == null || username == null) {
      throw Exception("LastFM API not initialized.");
    }
    final url = "$userStation$username${userStationEndpoints['library']}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch user library list');
    }
  }
}
