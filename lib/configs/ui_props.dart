import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_dimensions.dart';
import 'app_theme.dart';

abstract class UIProps {
  // Animations
  static Duration duration = const Duration(milliseconds: 280);
  static Duration duration2 = const Duration(milliseconds: 400);

  // Paddings
  static late EdgeInsets btnPadMed;
  static late EdgeInsets btnPadSm;

  // Radius
  static double radius = 15;
  static late BorderRadius tabRadius;
  static late BorderRadius buttonRadius;
  static late BorderRadius radiusS;
  static late BorderRadius radiusM;
  static late BorderRadius radiusL;
  static late BorderRadius radiusXL;
  static late BoxDecoration borderButton;
  static late BorderRadius topBoth15;
  static late BorderRadius topBoth30;
  static late BorderRadius topBoth50;

  // Shadows
  static List<BoxShadow>? cardShadow;
  static List<BoxShadow>? bottomNavigationShadow;
  // BoxDecoration
  static BoxDecoration? boxCard;

  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    initRadius(context);
    initButtons();
    initShadows();
    initBoxDecorations();
  }

  static initRadius(BuildContext context) {
    tabRadius = BorderRadius.circular(radius * 2);
    buttonRadius = BorderRadius.circular(radius * 10);

    radiusS = BorderRadius.circular(ScreenUtil().radius(8));
    radiusM = BorderRadius.circular(ScreenUtil().radius(15));
    radiusL = BorderRadius.circular(ScreenUtil().radius(25));
    radiusXL = BorderRadius.circular(ScreenUtil().radius(45));
    topBoth15 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(15)),
      topRight: Radius.circular(ScreenUtil().radius(15)),
    );
    topBoth30 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(25)),
      topRight: Radius.circular(ScreenUtil().radius(25)),
    );
    topBoth50 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(50)),
      topRight: Radius.circular(ScreenUtil().radius(50)),
    );
  }

  static initButtons() {
    borderButton = BoxDecoration(
      borderRadius: UIProps.buttonRadius,
      border: Border.all(
        width: 1.4,
        color: AppTheme.c.primary,
      ),
    );
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 2,
      vertical: AppDimensions.padding! * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 3,
      vertical: AppDimensions.padding! * 1.5,
    );
  }

  static initShadows() {
    cardShadow = [
      BoxShadow(
        color: AppTheme.c.primary.withAlpha(80),
        blurRadius: 18,
        spreadRadius: 0,
        offset: const Offset(0, 2),
      ),
    ];
    bottomNavigationShadow = [
      BoxShadow(
          color: AppTheme.c.shadowSub!,
          blurRadius: 6,
          spreadRadius: 0,
          offset: const Offset(4, 0)),
    ];
  }

  static initBoxDecorations() {
    boxCard = BoxDecoration(
      borderRadius: radiusM,
      boxShadow: cardShadow,
      color: AppTheme.c.backgroundSub,
    );
  }
}
