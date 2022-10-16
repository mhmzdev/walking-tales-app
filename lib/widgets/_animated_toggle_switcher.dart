import 'package:flutter/material.dart';
import 'package:walking_tales/configs/app_typography_ext.dart';

import '../configs/app_theme.dart';
import '../configs/app_typography.dart';

class AnimatedToggleSwitcher extends StatefulWidget {
  const AnimatedToggleSwitcher({Key? key}) : super(key: key);

  @override
  State<AnimatedToggleSwitcher> createState() => _AnimatedToggleSwitcherState();
}

class _AnimatedToggleSwitcherState extends State<AnimatedToggleSwitcher> {
  final animationDuration = const Duration(milliseconds: 300);
  bool isWeekly = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isWeekly = !isWeekly;
        });
      },
      child: AnimatedContainer(
        height: 60,
        width: 322,
        duration: animationDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppTheme.c.primaryDark,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Weekly",
                      style: AppText.h1b.cl(
                        Colors.white,
                      ),
                    ),
                    Text(
                      "Monthly",
                      style: AppText.h1b.cl(
                        Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedAlign(
              duration: animationDuration,
              alignment:
                  !isWeekly ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: 161,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(microseconds: 500),
                    child: Text(isWeekly ? "Weekly" : "Monthly",
                        style: AppText.h1b.cl(AppTheme.c.primaryDark!)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
