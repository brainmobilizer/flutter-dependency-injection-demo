import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/core/services/photos_service.dart';
import 'package:flutter_demo/ui/views/feed/feed_viewmodel.dart';
import 'package:flutter_demo/ui/widgets/photo_list_item.dart';
import 'package:flutter_demo/ui/routes.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<FeedViewModel>.reactive(
      builder: (BuildContext context, FeedViewModel model, Widget child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Feed',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Color(0xFFF29221),
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
      viewModelBuilder: () => FeedViewModel(photosService: Provider.of<PhotosService>(context)),
      onModelReady: (FeedViewModel model) => model.getFeed(),
    );
  }
}