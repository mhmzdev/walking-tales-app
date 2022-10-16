import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class CircularBackButton extends StatelessWidget {
  final int? quarterTurns;
  final Color? color;
  final double? size;
  final Color? iconColor;
  final IconData? icon;
  final VoidCallback? onPressed;
  const CircularBackButton({
    Key? key,
    this.quarterTurns = 0,
    this.color,
    this.size,
    this.iconColor,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 150),
      onPressed: onPressed ?? () => Navigator.pop(context),
      child: CircleAvatar(
        radius: size,
        backgroundColor: color ?? const Color.fromARGB(255, 234, 234, 234),
        child: RotatedBox(
          quarterTurns: quarterTurns!,
          child: Icon(
            icon ?? Icons.arrow_back_rounded,
            color: iconColor ?? const Color.fromARGB(255, 164, 163, 163),
          ),
        ),
      ),
    );
  }
}
