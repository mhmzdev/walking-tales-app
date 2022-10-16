import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:walking_tales/configs/app_typography_ext.dart';

import '../../../configs/app_theme.dart';
import '../../../configs/app_typography.dart';
import '../../../configs/space.dart';

class DashGauge extends StatefulWidget {
  final int? totalSteps;
  const DashGauge({Key? key, this.totalSteps}) : super(key: key);

  @override
  State<DashGauge> createState() => _DashGaugeState();
}

class _DashGaugeState extends State<DashGauge> {
  final CircularSliderAppearance gaugeAppearance = CircularSliderAppearance(
    customWidths: CustomSliderWidths(
      progressBarWidth: 8,
      handlerSize: 10,
    ),
    size: 200,
    customColors: CustomSliderColors(
      progressBarColors: [
        AppTheme.c.primaryDark!,
        AppTheme.c.primary,
        AppTheme.c.accent,
        AppTheme.c.accent,
      ],
      dotColor: AppTheme.c.primary,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      onChangeStart: (double value) {},
      onChangeEnd: (double value) {},
      innerWidget: (double percentage) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/footsteps.png",
            height: 30,
          ),
          Countup(
              begin: 0,
              end: widget.totalSteps!.toDouble(),
              duration: const Duration(seconds: 1),
              separator: ',',
              style: AppText.h1b.cl(AppTheme.c.primary).copyWith(fontSize: 24)),
          Space.y,
          Image.asset(
            "assets/trophy.png",
            color: AppTheme.c.primaryDark!,
            height: 20,
          ),
          Text(
            "8000",
            style: AppText.b2bm.cl(AppTheme.c.primaryDark!),
          )
        ],
      )),
      appearance: gaugeAppearance,
      min: 0,
      max: 8000,
      initialValue: widget.totalSteps!.toDouble() > 8000
          ? 8000
          : widget.totalSteps!.toDouble(),
    );
  }
}
