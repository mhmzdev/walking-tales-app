import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walking_tales/configs/app_theme.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final List<Widget>? overlayWidgets;
  const Screen({
    Key? key,
    required this.child,
    this.overlayWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: AppTheme.c.primary,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            child,
            ...overlayWidgets ?? [],
          ],
        ),
      ),
    );
  }
}
