import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;

  UserAgentClient(this.userAgent, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (userAgent == null) {
      if (request.headers.containsKey('user-agent'))
        request.headers.remove('user-agent');
    } else {
      request.headers['user-agent'] = userAgent;
    }
    
    return _inner.send(request);
  }
}

class HttpRetryClient extends http.BaseClient {
  final http.Client _inner;

  HttpRetryClient(this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final r = RetryOptions(maxAttempts: 3);
    final response = await r.retry(
      // Make a GET request
          () => _inner.send(request).timeout(Duration(seconds: 60)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException || e is HttpException,
    );

    return response;
  }
}