import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/models/user.dart';
import 'package:flutter_demo/core/models/album.dart';
import 'package:flutter_demo/core/services/users_service.dart';
import 'package:flutter_demo/core/services/albums_service.dart';

class PhotoViewModel extends BaseViewModel {
  UsersService _usersService;
  AlbumsService _albumsService;

  User _user;
  User get user => _user;

  bool get isUserFetched => user != null ? true : false;

  Album _album;
  Album get album => _album;

  bool get isAlbumFetched => album != null ? true : false;

  PhotoViewModel({
    @required UsersService usersService,
    @required AlbumsService albumsService
  }) : _usersService = usersService,
       _albumsService = albumsService;

  Future<void> getInfo(int albumId) async {
    setBusy(true);
    _album = await _albumsService.getAlbum(albumId);
    if (_album != null) {
      _user = await _usersService.getUserProfile(_album.userId);
    }
    setBusy(false);
  }
}