import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/utils/static_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void next() async {
    Future.delayed(const Duration(seconds: 3), () async {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamed(context, AppRoutes.login);
      } else {
        final authCubit = AuthCubit.cubit(context);
        await authCubit.fetch();

        if (!mounted) return;
        Navigator.pushNamed(context, AppRoutes.home);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    next();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: Space.h2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  StaticUtils.shoes2,
                  height: 300.h,
                ),
                Text(
                  'Walking Tales',
                  style: AppText.h1b.copyWith(
                    fontSize: AppDimensions.font(18),
                    color: AppTheme.c.primary,
                  ),
                ),
                Space.y,
                Text(
                  "Let's get your health back along with some gifts from your favourite brands!",
                  textAlign: TextAlign.center,
                  style: AppText.b2.cl(Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
