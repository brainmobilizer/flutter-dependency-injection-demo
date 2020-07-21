import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/services/photos_service.dart';
import 'package:flutter_demo/ui/widgets/photo_list_viewmodel.dart';
import 'package:flutter_demo/ui/widgets/photo_list_item.dart';
import 'package:flutter_demo/ui/routes.dart';

class PhotoList extends StatelessWidget {
  final int albumId;
  PhotoList(this.albumId);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotoListViewModel>.reactive(
      builder: (BuildContext context, PhotoListViewModel model, Widget child) => model.isBusy
        ? Center(
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
        : Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16),
              itemCount: model.photos.length,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => PhotoListItem(
                photo: model.photos[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.PHOTO,
                    arguments: model.photos[index],
                  );
                }
              )
          )
      ),
      viewModelBuilder: () => PhotoListViewModel(photosService: Provider.of<PhotosService>(context)),
      onModelReady: (PhotoListViewModel model) => model.getPhotosForAlbum(albumId),
    );
  }
}