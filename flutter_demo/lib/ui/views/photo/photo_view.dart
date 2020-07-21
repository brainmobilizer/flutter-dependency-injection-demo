import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/models/photo.dart';
import 'package:flutter_demo/core/services/users_service.dart';
import 'package:flutter_demo/core/services/albums_service.dart';
import 'package:flutter_demo/ui/views/photo/photo_viewmodel.dart';

class PhotoView extends StatelessWidget {
  final Photo photo;

  const PhotoView({ Key key, this.photo }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<PhotoViewModel>.reactive(
      builder: (BuildContext context, PhotoViewModel model, Widget child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text('Photo',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Color(0xFF607D8B),
        ),
        backgroundColor: Colors.grey[100],
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  photo.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.w900
                  )
                ),
              ),
              model.isAlbumFetched
              ? Padding(
                  padding: EdgeInsets.only(left: 16, top: 12, right: 16),
                  child: Text(
                    'from ${model.album.title}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0
                    ),
                  )
                )
              : Container(),
              model.isUserFetched
              ? Padding(
                  padding: EdgeInsets.only(left: 16, top: 12, right: 16),
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
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/default-image.jpg',
                      image: photo.url,
                      fit: BoxFit.cover
                    ),
                    clipBehavior: Clip.antiAlias,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => PhotoViewModel(
                                usersService: Provider.of<UsersService>(context),
                                albumsService: Provider.of<AlbumsService>(context)),
      onModelReady: (PhotoViewModel model) => model.getInfo(photo.albumId),
    );
  }
}