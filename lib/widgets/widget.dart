import 'package:flutter/material.dart';
import 'package:wallpaperApp/model/wallpaper_model.dart';
import 'package:wallpaperApp/views/image_view.dart';

Widget brandName() {
  return  RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      children: <TextSpan>[
        TextSpan(text: 'Wall ', style: TextStyle(color: Colors.black87)),
        TextSpan(text: 'Papzel', style: TextStyle(color: Colors.blue)),
      ],
    ),
  );
}

Widget wallpaperList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ImageView(
                  ImageURL : wallpaper.src.portrait
                )
              ));
            },
            child: Hero(
              tag:  wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
