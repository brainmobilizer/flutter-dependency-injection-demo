import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/core/services/api_client.dart';
import 'package:flutter_demo/core/models/photo.dart';

class PhotosApi {
  final ApiClient apiClient;

  PhotosApi({
    @required ApiClient client
  }) : apiClient = client;

  Future<List<Photo>> getPhotosForAlbum(int albumId) async {
    List<Photo> photos = List<Photo>();
    Response response = await apiClient.invokeAPI('/photos?albumId=$albumId',
                                             'GET',
                                             <QueryParam>[],
                                             null,
                                             <String, String>{},
                                             <String, String>{},
                                             'application/json',
                                             <String>[]);
    List<dynamic> parsed = json.decode(response.body);
    for (dynamic photo in parsed) {
      photos.add(Photo.fromJson(photo));
    }

    return photos;
  }

  Future<List<Photo>> getPhotosForFeed() async {
    List<Photo> photos = List<Photo>();
    Random rnd = new Random();
    for (int i = 0; i < 3; i++) {
      int albumId = rnd.nextInt(100);
      Response response = await apiClient.invokeAPI('/photos?albumId=$albumId',
                                              'GET',
                                              <QueryParam>[],
                                              null,
                                              <String, String>{},
                                              <String, String>{},
                                              'application/json',
                                              <String>[]);
      List<dynamic> parsed = json.decode(response.body);
      int count = 0;
      for (dynamic photo in parsed) {
        photos.add(Photo.fromJson(photo));
        count++;
        if (count > 3) break;
      }
    }

    return photos;
  }
}