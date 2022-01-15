class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants? get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get starbucks => toPng("starbucks");
  String get coffee_1 => toPng("coffee_1");
  String get coffee_2 => toPng("coffee_2");

  String toPng(String name) => "assets/images/$name.png";
}
