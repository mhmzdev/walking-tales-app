import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/utils/overlays.dart';
import 'package:walking_tales/utils/static_utils.dart';
import 'package:walking_tales/widgets/buttons/app_button.dart';
import 'package:walking_tales/widgets/screen/screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final authCubit = AuthCubit.cubit(context);

    return Screen(
      overlayWidgets: Overlays.authOverlay(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: Space.h2,
              child: Column(
                children: [
                  Space.top,
                  Lottie.asset(
                    StaticUtils.shoes2,
                    height: 300.h,
                  ),
                  Text(
                    'Hi! ${authCubit.state.data!.fullName}',
                    style: AppText.h1b.copyWith(
                      color: AppTheme.c.primary,
                      fontSize: AppDimensions.font(13),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Space.y2,
                  Text(
                    'We would like to Thank you for joining us at this very stage! Surely, we are going to ping you for our Beta launch!',
                    style: AppText.b1b.copyWith(
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Space.y2,
                  AppButton(
                    child: Text(
                      'Logout',
                      style: AppText.b1b.cl(Colors.white),
                    ),
                    onPressed: () => authCubit.logout(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
