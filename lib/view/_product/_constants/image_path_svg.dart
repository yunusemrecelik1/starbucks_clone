import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths get instance {
    return _instance ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();

  final loginBgSVG = 'login_bg'.toSVG;
  final starBucksCardLogo = 'sb_card_logo'.toSVG;
  final coffeeCup = 'coffee_cup'.toSVG;
}
