import 'package:http/http.dart';
import 'package:flutter_application/network/api_client.dart';

class ApiService {
  static const String getProductUrlPart = '/products';

  ApiClient _apiClient = ApiClient();

  Future<Response> getProducts() async {
    return await _apiClient.get(getProductUrlPart);
  }
}
