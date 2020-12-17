class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Allows Users to Sell or Rent used Books");
  sliderModel.setTitle("Books Sales");
  sliderModel.setImageAssetPath("assets/image4.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel
      .setDesc("Meet other students or your classmate anytime with chat");
  sliderModel.setTitle("Group Chats & Video");
  sliderModel.setImageAssetPath("assets/image8.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
