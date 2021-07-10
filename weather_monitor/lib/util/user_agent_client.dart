import 'package:http/http.dart' as http;

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