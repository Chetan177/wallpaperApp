class WallpaperModel {
  String photographer;
  String photographerURL;
  int photographerID;
  SrcModel src;

  WallpaperModel(
      {this.src, this.photographerURL, this.photographerID, this.photographer});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonData["src"]),
        photographerURL: jsonData["photographer_url"],
        photographerID: jsonData["photographer_id"],
        photographer: jsonData["photographer"]);
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel({this.portrait, this.original, this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData["original"],
        portrait: jsonData["portrait"],
        small: jsonData["small"]);
  }
}
