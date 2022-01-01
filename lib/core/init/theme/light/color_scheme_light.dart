// Flutter imports:
import 'package:flutter/material.dart';

class ColorSchemeLight{
    static ColorSchemeLight _instance;
    static ColorSchemeLight get instance {
    if(_instance == null) _instance = ColorSchemeLight._init();
    return _instance;
    }
    ColorSchemeLight._init();
    final Color primaryGreen = Color(0xff1D4D4F);
    final Color secondaryGreen = Color(0xff285F43);
    final Color mainGreen = Color(0xff4AA366);
    final Color lightGreen = Color(0xff5AAE8A);
    final Color primaryLightGreen = Color(0xffDDF1E9);
    final Color backgroundColor = Color(0xffF7F8FA);
    final Color red = Color(0xffc10e0e);
    final Color white = Color(0xffffffff);
    final Color gray = Color(0xff2E2D38);
    final Color lightGray = Color(0xfff7f7f7);
    final Color darkGray = Color(0xff676870);
    final Color black = Color(0xff020306);
    final Color azure = Color(0xff27928d);
}
