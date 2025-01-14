part of '../wikipedia_api.dart';

class OfflineApi {
  OfflineApi([ApiClient? apiClient])
      : apiClient = apiClient ?? _defaultApiClient;

  final ApiClient apiClient;

  /// Get styles and scripts for offline consumption of mobile-html-formatted pages
  ///
  /// Provides links to scripts and styles needed for viewing mobile-html-formatted pages offline.  Stability: [experimental](https://www.mediawiki.org/wiki/API_versioning#Experimental)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] title (required):
  ///   Page title. Use underscores instead of spaces. Use percent-encoding. Example: `Main_Page`.
  Future<Response> pageMobileHtmlOfflineResourcesTitleGetWithHttpInfo(
    String title,
  ) async {
    final path = r'/page/mobile-html-offline-resources/{title}'
        .replaceAll('{title}', title);


    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get styles and scripts for offline consumption of mobile-html-formatted pages
  ///
  /// Provides links to scripts and styles needed for viewing mobile-html-formatted pages offline.  Stability: [experimental](https://www.mediawiki.org/wiki/API_versioning#Experimental)
  ///
  /// Parameters:
  ///
  /// * [String] title (required):
  ///   Page title. Use underscores instead of spaces. Use percent-encoding. Example: `Main_Page`.
  Future<String?> pageMobileHtmlOfflineResourcesTitleGet(
    String title,
  ) async {
    final response = await pageMobileHtmlOfflineResourcesTitleGetWithHttpInfo(
      title,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'String',
      ) as String;
    }
    return null;
  }

  /// Get styles and scripts for offline consumption of mobile-html-formatted pages
  ///
  /// Provides links to scripts and styles needed for viewing mobile-html-formatted pages offline.  Stability: [experimental](https://www.mediawiki.org/wiki/API_versioning#Experimental)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] title (required):
  ///   Page title. Use underscores instead of spaces. Use percent-encoding. Example: `Main_Page`.
  ///
  /// * [int] revision (required):
  ///   Optional page revision. Note that older revisions are not stored, so request latency with the revision would be higher.
  Future<Response> pageMobileHtmlOfflineResourcesTitleRevisionGetWithHttpInfo(
    String title,
    int revision,
  ) async {
    final path = r'/page/mobile-html-offline-resources/{title}/{revision}'
        .replaceAll('{title}', title)
        .replaceAll('{revision}', revision.toString());


    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get styles and scripts for offline consumption of mobile-html-formatted pages
  ///
  /// Provides links to scripts and styles needed for viewing mobile-html-formatted pages offline.  Stability: [experimental](https://www.mediawiki.org/wiki/API_versioning#Experimental)
  ///
  /// Parameters:
  ///
  /// * [String] title (required):
  ///   Page title. Use underscores instead of spaces. Use percent-encoding. Example: `Main_Page`.
  ///
  /// * [int] revision (required):
  ///   Optional page revision. Note that older revisions are not stored, so request latency with the revision would be higher.
  Future<String?> pageMobileHtmlOfflineResourcesTitleRevisionGet(
    String title,
    int revision,
  ) async {
    final response =
        await pageMobileHtmlOfflineResourcesTitleRevisionGetWithHttpInfo(
      title,
      revision,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'String',
      ) as String;
    }
    return null;
  }
}
