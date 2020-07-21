import 'package:flutter/foundation.dart';
import 'package:flutter_demo/core/services/photos_api.dart';
import 'package:flutter_demo/core/models/photo.dart';

class PhotosService {
  final PhotosApi _photosApi;

  PhotosService({
    @required PhotosApi photosApi
  }) : _photosApi = photosApi;

  Future<List<Photo>> getPhotosForAlbum(int albumId) async {
    try {
      return await _photosApi.getPhotosForAlbum(albumId);
    } catch (e) {
      print('Error: ' + e.toString());
    }
    return <Photo>[];
  }

  Future<List<Photo>> getPhotosForFeed() async {
    try {
      return await _photosApi.getPhotosForFeed();
    } catch (e) {
      print('Error: ' + e.toString());
    }
    return <Photo>[];
  }
}