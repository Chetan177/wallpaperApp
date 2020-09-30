import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String ImageURL;

  ImageView({@required this.ImageURL});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.ImageURL,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.ImageURL,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _save();
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff1c1b1b).withOpacity(0.8),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white60),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Color(0x36ffffff),
                              Color(0x0fffffff)
                            ])),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Set Wallpaper",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                            Text(
                              "Save in Gallery",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio().get(widget.ImageURL,
        options: Options(responseType: ResponseType.bytes));
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      await Permission.storage.request().isGranted;
    } else {
      await Permission.storage.request().isGranted;
    }
  }
}
