import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/models/photo.dart';
import 'package:flutter_demo/core/services/photos_service.dart';

class PhotoListViewModel extends BaseViewModel {
  PhotosService _photosService;

  List<Photo> _photos;
  List<Photo> get photos => _photos;

  PhotoListViewModel({
    @required PhotosService photosService
  }) : _photosService = photosService;

  Future<void> getPhotosForAlbum(int albumId) async {
    setBusy(true);
    _photos = await _photosService.getPhotosForAlbum(albumId);
    setBusy(false);
  }
}