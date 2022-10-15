import 'package:flutter/material.dart';

class AppCoreTheme {
  late Color primary;
  Color? primaryLight;
  Color? primaryDark;

  late Color accent;
  Color? accentLight;
  Color? accentDark;

  Color? background;
  Color? backgroundSub;
  Color? scaffold;
  Color? scaffoldDark;

  late Color text;
  Color? textSub;
  Color? textSub2;

  Color? shadow; // Normal shadowOnBackground
  Color? shadowSub; // Shadow light

  AppCoreTheme({
    required this.primary,
    this.primaryLight,
    this.primaryDark,
    required this.accent,
    this.accentLight,
    this.accentDark,
    this.background,
    this.backgroundSub,
    this.scaffold,
    this.scaffoldDark,
    required this.text,
    this.textSub,
    this.textSub2,
    this.shadow,
    this.shadowSub,
  });

  AppCoreTheme copyWith({
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? accent,
    Color? accentLight,
    Color? accentDark,
    Color? background,
    Color? backgroundSub,
    Color? scaffold,
    Color? scaffoldDark,
    Color? text,
    Color? textSub,
    Color? textSub2,
    Color? shadow,
    Color? shadowSub,
    Color? upsellCard,
    Color? hotelChipRefundable,
    Color? hotelChipAirportTransfer,
  }) {
    return AppCoreTheme(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      accent: accent ?? this.accent,
      accentLight: accentLight ?? this.accentLight,
      accentDark: accentDark ?? this.accentDark,
      background: background ?? this.background,
      backgroundSub: backgroundSub ?? this.backgroundSub,
      scaffold: scaffold ?? this.scaffold,
      scaffoldDark: scaffoldDark ?? this.scaffoldDark,
      text: text ?? this.text,
      textSub: textSub ?? this.textSub,
      textSub2: textSub2 ?? this.textSub2,
      shadow: shadow ?? this.shadow,
      shadowSub: shadowSub ?? this.shadowSub,
    );
  }
}
