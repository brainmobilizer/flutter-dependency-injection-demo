import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/services/photos_service.dart';
import 'package:flutter_demo/core/models/photo.dart';

class FeedViewModel extends IndexTrackingViewModel {
  PhotosService _photosService;

  List<Photo> _photos;
  List<Photo> get photos => _photos;

  FeedViewModel({
    @required PhotosService photosService
  }) : _photosService = photosService {
    _photos = <Photo>[];
  }

  Future<void> getFeed() async {
    setBusy(true);
    _photos = await _photosService.getPhotosForFeed();
    setBusy(false);
  }
}