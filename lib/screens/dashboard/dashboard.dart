import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/utils/utils.dart';

import '../../providers/app_provider.dart';
import '../../widgets/bottom_bar/bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    final appPro = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: appPro.bottomIndex != 0
          ? null
          : DelayedDisplay(
              delay: const Duration(milliseconds: 200),
              child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.tracking);
                  },
                  label: const Text("Track Activity!")),
            ),
      body: Utils.navBarScreens[appPro.bottomIndex],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
