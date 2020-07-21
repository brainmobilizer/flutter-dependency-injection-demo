import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/services/albums_service.dart';
import 'package:flutter_demo/ui/views/explore/explore_viewmodel.dart';
import 'package:flutter_demo/ui/widgets/album_list_item.dart';
import 'package:flutter_demo/ui/routes.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<ExploreViewModel>.reactive(
      builder: (BuildContext context, ExploreViewModel model, Widget child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Explore',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Color(0xFF303F9F),
        ),
        backgroundColor: Colors.grey[100],
        body: model.isBusy
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
          : !model.hasError
              ? Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    itemCount: model.albums.length,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => AlbumListItem(
                      album: model.albums[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          // Routes.ALBUM + '/' + model.albums[index].id.toString(),
                          Routes.ALBUM,
                          arguments: model.albums[index],
                        );
                      }
                    )
                  ),
                )
              :  Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    model.error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
      ),
      viewModelBuilder: () => ExploreViewModel(albumsService: Provider.of<AlbumsService>(context)),
      onModelReady: (ExploreViewModel model) => model.getAlbums(),
    );
  }
}