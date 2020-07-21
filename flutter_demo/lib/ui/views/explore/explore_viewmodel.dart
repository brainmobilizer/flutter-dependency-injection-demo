import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/services/albums_service.dart';
import 'package:flutter_demo/core/models/album.dart';

class ExploreViewModel extends IndexTrackingViewModel {
  AlbumsService _albumsService;

  List<Album> get albums => _albumsService.albums;

  ExploreViewModel({
    @required AlbumsService albumsService
  }) : _albumsService = albumsService;

  Future<void> getAlbums() async {
    await runBusyFuture(_albumsService.getAlbums());
  }
}