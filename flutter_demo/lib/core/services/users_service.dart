import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/core/services/users_api.dart';
import 'package:flutter_demo/core/models/user.dart';

class UsersService {
  final UsersApi _usersApi;

  UsersService({
    @required UsersApi usersApi
  }) : _usersApi = usersApi;

  StreamController<User> _userController = StreamController<User>();

  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    try {
      User fetchedUser = await _usersApi.getUserProfile(userId);
      bool hasUser = fetchedUser != null;
      if (hasUser) {
        _userController.add(fetchedUser);
      }
      return hasUser;
    } catch (e) {
      print('Error: ' + e.toString());
    }
    return false;
  }

  Future<User> getUserProfile(int userId) async {
    try {
      return await _usersApi.getUserProfile(userId);
    } catch (e) {
      print('Error: ' + e.toString());
    }
    return null;
  }
}