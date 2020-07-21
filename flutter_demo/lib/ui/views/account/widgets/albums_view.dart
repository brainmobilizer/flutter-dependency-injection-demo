import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/ui/views/account/account_viewmodel.dart';
import 'package:flutter_demo/ui/widgets/album_list_item.dart';
import 'package:flutter_demo/ui/routes.dart';

class AlbumsView extends ViewModelWidget<AccountViewModel> {
  const AlbumsView({ Key key }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    Size screenSize = MediaQuery.of(context).size;
    return model.isBusy
      ? Container(
          width: screenSize.width,
          height: screenSize.height,
          alignment: Alignment.center,
          color: Color.fromRGBO(255, 255, 255, 0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
              ),
              SizedBox(height: 24),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
            ]
          ),
        )
      : Container(
          width: screenSize.width,
          height: screenSize.height,
          alignment: Alignment.center,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 16),
            itemCount: model.albums.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => AlbumListItem(
              album: model.albums[index],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.ALBUM,
                  arguments: model.albums[index],
                );
              }
            )
          ),
        );
  }
}