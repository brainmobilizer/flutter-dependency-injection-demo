import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/models/album.dart';
import 'package:flutter_demo/core/services/users_service.dart';
import 'package:flutter_demo/ui/views/album/album_viewmodel.dart';
import 'package:flutter_demo/ui/widgets/photo_list.dart';

class AlbumView extends StatelessWidget {
  final Album album;

  const AlbumView({ Key key, this.album }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumViewModel>.reactive(
      builder: (BuildContext context, AlbumViewModel model, Widget child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text('Album',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Color(0xFF607D8B),
        ),
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                album.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w900
                )
              ),
            ),
            SizedBox(height: 12),
            model.isUserFetched
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'by ${model.user.name}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0
                  ),
                )
              )
            : Container(),
            SizedBox(height: 24),
            PhotoList(album.id)
          ],
        ),
      ),
      viewModelBuilder: () => AlbumViewModel(usersService: Provider.of<UsersService>(context)),
      onModelReady: (AlbumViewModel model) => model.getUser(album.userId),
    );
  }
}