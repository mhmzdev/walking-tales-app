import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/painters/notification_bell.dart';
import 'package:walking_tales/painters/stats.dart';
import 'package:walking_tales/painters/trophy.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.v,
      child: Row(
        children: [
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 300),
            slidingBeginOffset: const Offset(-10, 0),
            child: Card(
              shape: const CircleBorder(),
              child: Padding(
                padding: Space.all(2, 2),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const NetworkImage(
                      "https://media.istockphoto.com/photos/beautiful-gorgeous-50s-mid-aged-mature-woman-looking-at-camera-on-picture-id1302319506?k=20&m=1302319506&s=612x612&w=0&h=dmwIVCs3yEuapyFVgbxAql6_I3QH5FnACKoy7fOX1Eg="),
                ),
              ),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 250),
            slidingBeginOffset: const Offset(-10, 0),
            child: CustomPaint(
              painter: StatsPainter(),
              size: const Size(
                16,
                16,
              ),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 200),
            slidingBeginOffset: const Offset(-10, 0),
            child: Text(
              "6",
              style: AppText.h3bm.cl(AppTheme.c.primaryDark!),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 150),
            slidingBeginOffset: const Offset(-10, 0),
            child: CustomPaint(
              painter: TrophyPainter(),
              size: const Size(
                16,
                16,
              ),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 100),
            slidingBeginOffset: const Offset(-10, 0),
            child: Text(
              "12",
              style: AppText.h3bm.cl(AppTheme.c.primaryDark!),
            ),
          ),
          const Expanded(child: SizedBox()),
          DelayedDisplay(
            delay: const Duration(milliseconds: 100),
            slidingBeginOffset: const Offset(10, 0),
            child: Bounce(
              onPressed: () {},
              duration: const Duration(milliseconds: 200),
              child: CustomPaint(
                painter: NotificationBellPainter(),
                size: const Size(16, 16),
              ),
            ),
          ),
          Space.x2
        ],
      ),
    );
  }
}
