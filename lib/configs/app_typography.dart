import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:flutter/material.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static late TextStyle h1;
  static late TextStyle h1b;
  static late TextStyle h1bm;
  static late TextStyle h2;
  static late TextStyle h2b;
  static late TextStyle h2bm;
  static late TextStyle h3;
  static late TextStyle h3b;
  static late TextStyle h3bm;

  // Body
  static late TextStyle b1;
  static late TextStyle b1b;
  static late TextStyle b1bm;
  static late TextStyle b2;
  static late TextStyle b2b;
  static late TextStyle b2bm;

  // Label
  static late TextStyle l1;
  static late TextStyle l1b;
  static late TextStyle l1bm;
  static late TextStyle l2;
  static late TextStyle l2b;
  static late TextStyle l2bm;

  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    const b = FontWeight.bold;
    const baseStyle = TextStyle(fontFamily: fontFamily);

    h1 = baseStyle.copyWith(fontSize: 24.h);
    h1b = h1.copyWith(fontWeight: b);
    h1bm = h1.copyWith(fontWeight: FontWeight.w500);

    h2 = baseStyle.copyWith(fontSize: 20.h);
    h2b = h2.copyWith(fontWeight: b);
    h2bm = h2.copyWith(fontWeight: FontWeight.w500);

    h3 = baseStyle.copyWith(fontSize: 18.h);
    h3b = h3.copyWith(fontWeight: b);
    h3bm = h3.copyWith(fontWeight: FontWeight.w500);

    b1 = baseStyle.copyWith(fontSize: 16.h);
    b1b = b1.copyWith(fontWeight: b);
    b1bm = b1.copyWith(fontWeight: FontWeight.w500);

    b2 = baseStyle.copyWith(fontSize: 14.h);
    b2b = b2.copyWith(fontWeight: b);
    b2bm = b2.copyWith(fontWeight: FontWeight.w500);

    l1 = baseStyle.copyWith(fontSize: 12.h);
    l1b = l1.copyWith(fontWeight: b);
    l1bm = l1.copyWith(fontWeight: FontWeight.w500);

    l2 = baseStyle.copyWith(fontSize: 10.h);
    l2b = l2.copyWith(fontWeight: b);
    l2bm = l2.copyWith(fontWeight: FontWeight.w500);
  }
}
