import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;

import 'app_dimensions.dart';
import 'app_theme.dart';
import 'app_typography.dart';
import 'space.dart';
import 'ui.dart';
import 'ui_props.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) async {
    UI.init(context);
    AppDimensions.init();
    AppTheme.init(context);
    UIProps.init(context);
    Space.init(context);
    AppText.init(context);
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }

  static String format(num number, [String? currencyPrefix]) {
    if (currencyPrefix != null && currencyPrefix.contains(" ")) {
      currencyPrefix = currencyPrefix.substring(0, currencyPrefix.length - 1);
    }
    return NumberFormat.currency(
      locale: 'en_PK',
      symbol: currencyPrefix ?? 'PKR ',
      decimalDigits: 0,
    ).format(
      number,
    );
  }

  static String formatWithOutPrefix(num number, [String? currencyPrefix]) {
    if (currencyPrefix != null && currencyPrefix.contains(" ")) {
      currencyPrefix = currencyPrefix.substring(0, currencyPrefix.length - 1);
    }
    return NumberFormat.currency(
      locale: 'en_PK',
      symbol: '',
      decimalDigits: 0,
    ).format(
      number,
    );
  }

  static String id() {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        18,
        (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
  }
}
