import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/core/services/api_client.dart';
import 'package:flutter_demo/core/models/user.dart';

class UsersApi {
  final ApiClient apiClient;

  UsersApi({
    @required ApiClient client
  }) : apiClient = client;

  Future<User> getUserProfile(int userId) async {
    Response response = await apiClient.invokeAPI('/users/$userId',
                                             'GET',
                                             <QueryParam>[],
                                             null,
                                             <String, String>{},
                                             <String, String>{},
                                             'application/json',
                                             <String>[]);
    return User.fromJson(json.decode(response.body));
  }
}