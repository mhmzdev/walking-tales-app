import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:walking_tales/configs/app.dart';
import 'package:walking_tales/configs/configs.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? color;
  final double? height;
  final double? width;
  const AppButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.height,
    this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 60.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: UIProps.radiusM,
          color: color ?? AppTheme.c.primary,
        ),
        child: child,
      ),
    );
  }
}
