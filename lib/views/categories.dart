import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperApp/data/data.dart';
import 'package:wallpaperApp/model/wallpaper_model.dart';
import 'package:wallpaperApp/widgets/widget.dart';

class Categories extends StatefulWidget {
  final String categoryName;
  Categories({this.categoryName});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  // Wallpaper List
  List<WallpaperModel> wallpapers = new List();

  getSearchWallpaper(String query) async {

    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=20&",
        headers: {"Authorization": apiKEY});

    // Load wallpaper
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    // create new screen
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpaper(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 16,
              ),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
