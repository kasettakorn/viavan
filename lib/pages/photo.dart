import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viavan/models/photos.dart';
import 'package:flutter/services.dart'; //read data

class PhotoPage extends StatefulWidget {
  String args;

  PhotoPage(String args) {
    this.args = args;
  }

  @override
  State<StatefulWidget> createState() {
    return _PhotoState();
  }
}

class _PhotoState extends State<PhotoPage> {
  String args;
  List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    List<String> list = ['xxx', 'yyy', 'zzz'];


    List<String> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Photo show"),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Load data"),
                  onPressed: () {
                    Future<String> photosJson = rootBundle.loadString('json/photos.json'); //asynchronous
                    photosJson.then((value) {
                      photos = photoFromJson(value);
                      print(photos.length);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Show data"),
                  onPressed: () {
                    print("Enter");
                    setState(() {
                      //Force create widget
                    });
                  },
                ),
              ],
            ),
            (photos != null)
                ? Column(
                    children: photos.getRange(0, 100).map((photo) {
                    return Card(
                      child: ListTile(
                        title: Text(photo.title),
                        leading: Image.network(
                          photo.thumbnailUrl,
                          width: 50,
                        ),
                      ),
                    );
                  }).toList())
                : Container()
          ],
        ));
  }
}
