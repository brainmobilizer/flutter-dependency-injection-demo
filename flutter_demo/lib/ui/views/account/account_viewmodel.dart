import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/models/album.dart';
import 'package:flutter_demo/core/services/users_service.dart';
import 'package:flutter_demo/core/services/albums_service.dart';

class AccountViewModel extends IndexTrackingViewModel {
  UsersService _usersService;
  AlbumsService _albumsService;

  List<Album> _albums;
  List<Album> get albums => _albums;

  AccountViewModel({
    @required UsersService usersService,
    @required AlbumsService albumsService
  }) : _usersService = usersService,
       _albumsService = albumsService {
    _albums = <Album>[];
  }

  Future<void> login(String code) async {
    setBusy(true);
    int userId = int.parse(code);
    bool result = await _usersService.login(userId);
    setBusy(false);

    if (result) {
      await getMyAlbums(userId);
    }
  }

  Future<void> getMyAlbums(int userId) async {
    if (userId == -1) return;
    setBusy(true);
    _albums = await _albumsService.getMyAlbums(userId);
    setBusy(false);
  }
}