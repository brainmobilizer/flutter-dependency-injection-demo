import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/photo.dart';

class PhotoListItem extends StatelessWidget {
  final Photo photo;
  final Function onTap;
  const PhotoListItem({this.photo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 16),
      padding: EdgeInsets.all(0),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            offset: Offset(0.0, 1.0),
            color: Color.fromARGB(80, 0, 0, 0)
          )
        ]
      ),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/default-image.jpg',
                  image: photo.thumbnailUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover
                ),
                clipBehavior: Clip.antiAlias,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(photo.title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16)),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                hoverColor: Color.fromARGB(60, Colors.grey.red, Colors.grey.green, Colors.grey.blue),
                onTap: () {
                  if (onTap != null) {
                    onTap();
                  }
                },
              )
            )
          )
        ],
      )
    );
  }
}