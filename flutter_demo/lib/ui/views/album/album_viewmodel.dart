import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/models/user.dart';
import 'package:flutter_demo/core/services/users_service.dart';

class AlbumViewModel extends BaseViewModel {
  UsersService _usersService;

  User _user;
  User get user => _user;

  bool get isUserFetched => user != null ? true : false;

  AlbumViewModel({
    @required UsersService usersService
  }) : _usersService = usersService;

  Future<void> getUser(int userId) async {
    setBusy(true);
    _user = await _usersService.getUserProfile(userId);
    setBusy(false);
  }
}