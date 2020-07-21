import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/album.dart';
import 'package:flutter_demo/core/models/photo.dart';
import 'package:flutter_demo/ui/routes.dart';
import 'package:flutter_demo/ui/views/feed/feed_view.dart';
import 'package:flutter_demo/ui/views/explore/explore_view.dart';
import 'package:flutter_demo/ui/views/account/account_view.dart';
import 'package:flutter_demo/ui/views/album/album_view.dart';
import 'package:flutter_demo/ui/views/photo/photo_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name);
    switch (uri.path) {
      case Routes.FEED:
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => FeedView());
      case Routes.EXPLORE:
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => ExploreView());
      case Routes.ACCOUNT:
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => AccountView());
      case Routes.ALBUM:
        Album album = settings.arguments as Album;
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => AlbumView(album: album));
      case Routes.PHOTO:
      Photo photo = settings.arguments as Photo;
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => PhotoView(photo: photo));
      default:
        return MaterialPageRoute<void>(builder: (_) => FeedView());
    }
  }
}