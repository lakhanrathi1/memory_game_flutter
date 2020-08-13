class TileModel{
  String imagePath;
  bool isSelected;

  TileModel({this.imagePath, this.isSelected});

  void setImageAssetPath(String path){
    imagePath = path;
  }

  void setIsSelected(bool isSelected){
    isSelected = isSelected;
  }


  String getImagePath(){
    return imagePath;
  }

  bool getIsSelected(){
    return isSelected;
  }


}