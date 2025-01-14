part of '../wikipedia_api.dart';

class TalkPagesApi {
  TalkPagesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? _defaultApiClient;

  final ApiClient apiClient;

  /// Get structured talk page contents
  ///
  /// Gets structured talk page contents for the provided title.  Stability: [experimental](https://www.mediawiki.org/wiki/Wikimedia_Product/Wikimedia_Product_Infrastructure_team/API_endpoint_stability_policy#Experimental)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] title (required):
  ///   Page title. Use underscores instead of spaces. Use percent-encoding. Example: `Main_Page`.
  ///
  /// * [bool] redirect:
  ///   Requests for [redirect pages](https://www.mediawiki.org/wiki/Help:Redirects) return HTTP 302 with a redirect target in `Location` header and content in the body. To get a 200 response instead, supply `false` to the `redirect` parameter.
  Future<Response> pageTalkTitleGetWithHttpInfo(
    String title, {
    bool? redirect,
  }) async {
    final path = r'/page/talk/{title}'.replaceAll('{title}', title);


    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (redirect != null) {
      queryParams.addAll(_queryParams('', 'redirect', redirect));
    }

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

  /// Get structured talk page contents
  ///
  /// Gets structured talk page contents for the provided title.  Stability: [experimental](https://www.mediawiki.org/wiki/Wikimedia_Product/Wikimedia_Product_Infrastructure_team/API_endpoint_stability_policy#Experimental)
  ///
  /// Parameters:
  ///
  /// * [String] title (required):
  ///   Page title. Use underscores instead of spaces. Use percent-encoding. Example: `Main_Page`.
  ///
  /// * [bool] redirect:
  ///   Requests for [redirect pages](https://www.mediawiki.org/wiki/Help:Redirects) return HTTP 302 with a redirect target in `Location` header and content in the body. To get a 200 response instead, supply `false` to the `redirect` parameter.
  Future<String?> pageTalkTitleGet(
    String title, {
    bool? redirect,
  }) async {
    final response = await pageTalkTitleGetWithHttpInfo(
      title,
      redirect: redirect,
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

  /// Get structured talk page contents
  ///
  /// Gets structured talk page contents for the provided title.  Stability: [experimental](https://www.mediawiki.org/wiki/Wikimedia_Product/Wikimedia_Product_Infrastructure_team/API_endpoint_stability_policy#Experimental)
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
  ///
  /// * [bool] redirect:
  ///   Requests for [redirect pages](https://www.mediawiki.org/wiki/Help:Redirects) return HTTP 302 with a redirect target in `Location` header and content in the body. To get a 200 response instead, supply `false` to the `redirect` parameter.
  Future<Response> pageTalkTitleRevisionGetWithHttpInfo(
    String title,
    int revision, {
    bool? redirect,
  }) async {
    final path = r'/page/talk/{title}/{revision}'
        .replaceAll('{title}', title)
        .replaceAll('{revision}', revision.toString());


    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (redirect != null) {
      queryParams.addAll(_queryParams('', 'redirect', redirect));
    }

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

  /// Get structured talk page contents
  ///
  /// Gets structured talk page contents for the provided title.  Stability: [experimental](https://www.mediawiki.org/wiki/Wikimedia_Product/Wikimedia_Product_Infrastructure_team/API_endpoint_stability_policy#Experimental)
  ///
  /// Parameters:
  ///
  /// * [String] title (required):
  ///   Page title. Use underscores instead of spaces. Use percent-encoding. Example: `Main_Page`.
  ///
  /// * [int] revision (required):
  ///   Optional page revision. Note that older revisions are not stored, so request latency with the revision would be higher.
  ///
  /// * [bool] redirect:
  ///   Requests for [redirect pages](https://www.mediawiki.org/wiki/Help:Redirects) return HTTP 302 with a redirect target in `Location` header and content in the body. To get a 200 response instead, supply `false` to the `redirect` parameter.
  Future<String?> pageTalkTitleRevisionGet(
    String title,
    int revision, {
    bool? redirect,
  }) async {
    final response = await pageTalkTitleRevisionGetWithHttpInfo(
      title,
      revision,
      redirect: redirect,
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
