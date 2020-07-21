import 'package:flutter/foundation.dart';
import 'package:flutter_demo/core/services/albums_api.dart';
import 'package:flutter_demo/core/models/album.dart';

class AlbumsService {
  final AlbumsApi _albumsApi;

  List<Album> _albums;
  List<Album> get albums => _albums;

  AlbumsService({
    @required AlbumsApi albumsApi
  }) : _albumsApi = albumsApi {
    _albums = <Album>[];
  }

  Future<bool> getAlbums() async {
    try {
      _albums = await _albumsApi.getAlbums();
      return true;
    } catch (e) {
      print('Error: ' + e.toString());
    }
    return false;
  }

  Future<List<Album>> getMyAlbums(int userId) async {
    try {
      return _albumsApi.getAlbumsForUser(userId);
    } catch (e) {
      print('Error: ' + e.toString());
    }
    return <Album>[];
  }

  Future<Album> getAlbum(int albumId) async {
    try {
      return _albumsApi.getAlbum(albumId);
    } catch (e) {
      print('Error: ' + e.toString());
    }
    return null;
  }
}