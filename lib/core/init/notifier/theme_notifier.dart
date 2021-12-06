// Flutter imports:
import 'package:flutter/material.dart';
import 'package:starbucks_clone/core/init/theme/app_theme_light.dart';

// Project imports:
import '../../constants/enums/app_theme_enum.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;
  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
