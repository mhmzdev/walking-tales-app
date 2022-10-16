import 'package:flutter/material.dart';

import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/app_typography_ext.dart';

import '../configs/app_dimensions.dart';
import '../configs/app_theme.dart';
import '../configs/app_typography.dart';
import '../configs/ui_props.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Widget? child;
  final Color? color;
  final double? height;
  final Color? borderColor;
  const PrimaryButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.height,
    required this.child,
    this.color,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return SizedBox(
      height: height ?? 75.h,
      width: AppDimensions.size.width,
      child: Bounce(
        duration: const Duration(milliseconds: 110),
        onPressed: onPressed!,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? AppTheme.c.primary,
            borderRadius: UIProps.radiusM,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Center(
            child: child ??
                Text(
                  title!,
                  style: AppText.h2b.cl(
                    Colors.white,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
