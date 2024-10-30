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
          () => _inner.send(_copyRequest(request)).timeout(Duration(seconds: 60)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException || e is HttpException,
    );

    return response;
  }

  http.BaseRequest _copyRequest(http.BaseRequest request) {
    http.BaseRequest requestCopy;

    if(request is http.Request) {
      requestCopy = http.Request(request.method, request.url)
        ..encoding = request.encoding
        ..bodyBytes = request.bodyBytes;
    }
    else if(request is http.MultipartRequest) {
      requestCopy = http.MultipartRequest(request.method, request.url)
        ..fields.addAll(request.fields)
        ..files.addAll(request.files);
    }
    else if(request is http.StreamedRequest) {
      throw Exception('copying streamed requests is not supported');
    }
    else {
      throw Exception('request type is unknown, cannot copy');
    }

    requestCopy
      ..persistentConnection = request.persistentConnection
      ..followRedirects = request.followRedirects
      ..maxRedirects = request.maxRedirects
      ..headers.addAll(request.headers);

    return requestCopy;
  }
}