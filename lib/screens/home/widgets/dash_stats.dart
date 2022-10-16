import 'package:countup/countup.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/user_stats/cubit.dart';
import 'package:walking_tales/utils/utils.dart';

class DashStats extends StatelessWidget {
  final UserStatsState? state;
  const DashStats({Key? key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 200),
      child: Container(
        margin: Space.all(),
        padding: Space.all(0, 20),
        decoration: BoxDecoration(
            borderRadius: UIProps.radiusXL,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppTheme.c.accent.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            5,
            (index) => index.isOdd
                ? const DashStatDivider()
                : DashStatTile(
                    title: Utils.dashStats[index][0],
                    value: getValue(index),
                    subtitle: Utils.dashStats[index][2],
                  ),
          ),
        ),
      ),
    );
  }

  double getValue(int index) {
   
    switch (index) {
      case 0:
        return state!.totalCaloriesBurned!.toDouble();
      case 2:
        return double.parse(state!.averageSpeed!.toStringAsFixed(1));
      case 4:
        return double.parse(state!.distanceTraveled!.toStringAsFixed(1));
      default:
        return 0.0;
    }
  }
}

class DashStatTile extends StatelessWidget {
  final String? title;
  final double? value;
  final String? subtitle;
  const DashStatTile({Key? key, this.title, this.value, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title!,
          style: AppText.b2bm,
        ),
        Countup(
            begin: 0,
            end: value!,
            duration: const Duration(seconds: 1),
            separator: ',',
            style:
                AppText.h1b.cl(AppTheme.c.primaryDark!).copyWith(fontSize: 24)),
        // Text(
        //  ,
        //   style: AppText.h3b.cl(AppTheme.c.primaryDark!).copyWith(fontSize: 24),
        // ),
        Text(
          subtitle!,
          style: AppText.b2bm,
        )
      ],
    );
  }
}

class DashStatDivider extends StatelessWidget {
  const DashStatDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 3,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.c.accent,
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
          borderRadius: UIProps.radiusXL),
    );
  }
}
