import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/core/services/api_client.dart';
import 'package:flutter_demo/core/models/album.dart';

class AlbumsApi {
  final ApiClient apiClient;

  AlbumsApi({
    @required ApiClient client
  }) : apiClient = client;

  Future<List<Album>> getAlbums() async {
    List<Album> albums = List<Album>();
    Response response = await apiClient.invokeAPI('/albums',
                                             'GET',
                                             <QueryParam>[],
                                             null,
                                             <String, String>{},
                                             <String, String>{},
                                             'application/json',
                                             <String>[]);
    List<dynamic> parsed = json.decode(response.body);
    for (dynamic album in parsed) {
      albums.add(Album.fromJson(album));
    }

    return albums;
  }

  Future<List<Album>> getAlbumsForUser(int userId) async {
    List<Album> albums = List<Album>();
    Response response = await apiClient.invokeAPI('/albums?userId=$userId',
                                             'GET',
                                             <QueryParam>[],
                                             null,
                                             <String, String>{},
                                             <String, String>{},
                                             'application/json',
                                             <String>[]);
    List<dynamic> parsed = json.decode(response.body);
    for (dynamic album in parsed) {
      albums.add(Album.fromJson(album));
    }

    return albums;
  }

  Future<Album> getAlbum(int albumId) async {
    Response response = await apiClient.invokeAPI('/albums/$albumId',
                                             'GET',
                                             <QueryParam>[],
                                             null,
                                             <String, String>{},
                                             <String, String>{},
                                             'application/json',
                                             <String>[]);
    Map<String, dynamic> parsed = json.decode(response.body);
    if (parsed != null) {
      return Album.fromJson(parsed);
    }

    return null;
  }
}