import 'package:flutter/material.dart';
import 'package:starbucks_clone/core/init/theme/app_theme.dart';
import 'package:starbucks_clone/core/init/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight? get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme(),
        textTheme: textTheme(),
        inputDecorationTheme: inputDecorationTheme(),
        primaryColor: Colors.white,
        appBarTheme: appBarTheme(),
        scaffoldBackgroundColor: colorSchemeLight?.backgroundColor,
        primaryTextTheme: primaryTextTheme(),
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: colorSchemeLight?.mainGreen),
      );

  AppBarTheme appBarTheme() => AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: textThemeLight!.headline5.copyWith(color: colorSchemeLight!.primaryGreen,fontWeight: FontWeight.w600)
  );

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle:
          textThemeLight?.headline6.copyWith(color: colorSchemeLight?.darkGray),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorSchemeLight!.darkGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorSchemeLight!.darkGray),
      ),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight!.headline1,
      headline2: textThemeLight!.headline2,
      headline3: textThemeLight!.headline3,
      headline4: textThemeLight!.headline4,
      headline5: textThemeLight!.headline5,
      headline6: textThemeLight!.headline6,
      overline: textThemeLight!.overLine,
    );
  }

  TextTheme primaryTextTheme() {
    return TextTheme(
      headline6: TextStyle(
          color: colorSchemeLight?.primaryGreen,
          fontWeight: FontWeight.w600,
          fontSize: 20),
    );
  }

  ColorScheme _appColorScheme() {
    return ColorScheme(
      primary: colorSchemeLight!.primaryGreen,
      primaryVariant: colorSchemeLight!.secondaryGreen,
      secondary: colorSchemeLight!.mainGreen,
      //xx

      secondaryVariant: Colors.black,
      surface: colorSchemeLight!.azure,
      background: Color(0xfff6f9fc),
      error: Colors.red[900]!,
      onPrimary: colorSchemeLight!.backgroundColor,
      //xx
      onSecondary: colorSchemeLight!.gray,
      //xx
      onSurface: colorSchemeLight!.darkGray,
      //xx
      onBackground: Colors.white,
      //xx
      onError: Color(0xffffc93c),
      //xx
      brightness: Brightness.light,
    );
  }
}
