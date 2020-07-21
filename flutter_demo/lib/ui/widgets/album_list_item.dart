import 'package:flutter/material.dart';
import 'package:flutter_demo/core/models/album.dart';

class AlbumListItem extends StatelessWidget {
  final Album album;
  final Function onTap;
  const AlbumListItem({this.album, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, top: 0, right: 24, bottom: 16),
      padding: EdgeInsets.all(0),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(24),
                child: Text(album.title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16.0)),
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