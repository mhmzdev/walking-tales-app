import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/app_theme.dart';

class AppDividers {
  static Widget simple(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return Divider(
      height: 40.h,
      color: AppTheme.c.primary,
    );
  }
}
