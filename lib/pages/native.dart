import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:viavan/models/reqLogin.dart';

class NativePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NativeState();
  }
}

class _NativeState extends State<NativePage> {
  @override
  String base64;
  var image;
  VideoPlayerController _controller;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Native Feature"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('Toast'),
            onPressed: () {
              Toast.show("Toast plugin app", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            },
          ),
          RaisedButton(
            child: Text('Base64'),
            onPressed: () async {
              ByteData bs = await rootBundle.load('images/logo.jpg');
              List<int> ls =
                  bs.buffer.asUint8List(); //Convert to unsigned int 8 bit
              base64 = convert.base64Encode(ls);
              print(base64);
            },
          ),
          RaisedButton(
            child: Text('HTTP'),
            onPressed: () async {
              var reqLogin = ReqLogin();
              reqLogin.email = 'eve.holt@reqres.in';
              reqLogin.password = "cityslicka";
              String jsonReq = reqLoginToJson(reqLogin);
             // print(jsonReq);

              var response = await http.get('http://www.omdbapi.com/?apikey=37b030ff&t=aquaman');
              print(response.statusCode);
            },
          ),
          RaisedButton(
            child: Text('Camera'),
            onPressed: () async {
              image = await ImagePicker.pickImage(source: ImageSource.camera);
              setState(() {});
            },
          ),
          RaisedButton(
            child: Text('Stream Video'),
            onPressed: () {
              String url =
                  'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';
              _controller = VideoPlayerController.network(url)
                ..initialize().then((value) {
                  setState(() {
                    _controller.play();
                  });
                });
            },
          ),
          (image != null) ? Image.file(image) : Container(),
          (_controller != null && _controller.value.initialized)
              ? Chewie(
                  controller:
                      ChewieController(videoPlayerController: _controller),
                )
              : Container(),
        ],
      ),
    );
  }
}
