import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_demo/core/services/api.dart';
import 'package:flutter_demo/core/services/albums_api.dart';
import 'package:flutter_demo/core/services/photos_api.dart';
import 'package:flutter_demo/core/services/users_api.dart';
import 'package:flutter_demo/core/services/albums_service.dart';
import 'package:flutter_demo/core/services/photos_service.dart';
import 'package:flutter_demo/core/services/users_service.dart';
import 'package:flutter_demo/core/models/user.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Api, AlbumsApi>(
    update: (BuildContext context, Api api, AlbumsApi albumsApi) =>
        AlbumsApi(client: api.client),
  ),
  ProxyProvider<Api, PhotosApi>(
    update: (BuildContext context, Api api, PhotosApi photosApi) =>
        PhotosApi(client: api.client),
  ),
  ProxyProvider<Api, UsersApi>(
    update: (BuildContext context, Api api, UsersApi usersApi) =>
        UsersApi(client: api.client),
  ),
  ProxyProvider<AlbumsApi, AlbumsService>(
    update: (BuildContext context, AlbumsApi albumsApi, AlbumsService albumsService) =>
        AlbumsService(albumsApi: albumsApi),
  ),
  ProxyProvider<PhotosApi, PhotosService>(
    update: (BuildContext context, PhotosApi photosApi, PhotosService photosService) =>
        PhotosService(photosApi: photosApi),
  ),
  ProxyProvider<UsersApi, UsersService>(
    update: (BuildContext context, UsersApi usersApi, UsersService usersService) =>
        UsersService(usersApi: usersApi),
  )
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<UsersService>(context, listen: false).user,
  )
];