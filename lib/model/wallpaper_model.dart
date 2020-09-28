class WallpaperModel{

  String photographer;
  String photographerURL;
  int photographerID;
  SrcModel src;

  WallpaperModel({this.src, this.photographerURL, this.photographerID, this.photographer});

}


class SrcModel{
  String original;
  String small;
  String portrait;

  SrcModel({this.portrait, this.original, this.small});
}