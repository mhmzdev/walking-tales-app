import 'package:flutter/material.dart';
import 'app_core_theme.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    primary: const Color(0xff8870E6),
    primaryDark: const Color(0xff1c214f),
    accent: const Color(0xffC470E6),
    text: const Color(0xFF292c39),
    textSub: const Color(0xff9d9da6),
    background: const Color(0xFFF9F9F9),
    backgroundSub: const Color(0xFFF3FBFE),
    shadow: Colors.black.withOpacity(0.25),
    shadowSub: const Color(0xFFD9D9D9),
  );

  static AppCoreTheme light = _core;

  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  // Init
  static init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
