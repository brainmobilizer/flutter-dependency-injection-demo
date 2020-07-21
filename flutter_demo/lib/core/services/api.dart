import 'package:flutter_demo/core/services/api_client.dart';

class Api {
  ApiClient _client;
  ApiClient get client => _client;

  Api() {
    _client = ApiClient(basePath: 'https://jsonplaceholder.typicode.com');
  }
}