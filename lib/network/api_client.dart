import 'package:http/http.dart';

class ApiClient {
  final String endpoint = 'fakestoreapi.com';

  var _httpClient = Client();

  Future<Response> get(String urlPart,
      {Map<String, String> args, String token}) async {
    Uri uri = Uri.https(endpoint, urlPart, args);

    return _httpClient.get(uri);
  }
}
