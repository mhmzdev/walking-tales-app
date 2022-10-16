import 'dart:async';

import 'package:flutter/material.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/cubits/user_stats/cubit.dart';

import '../../providers/user_location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getUserLocation() async {
    final userStatsCubit = UserStatsCubit.cubit(context);

    userStatsCubit.fetch();
    final userLocationProvider = UserLocationProvider.state(context);
    await userLocationProvider.getUserLocation();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, AppRoutes.dashboard);
    });
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
