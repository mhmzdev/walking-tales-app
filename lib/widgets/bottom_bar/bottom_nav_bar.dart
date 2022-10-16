import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/utils/utils.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/ui_props.dart';
import '../../models/nav_bar_item_model.dart';
import 'nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    List<NavbarItemModel> bottomItems = [];

    bottomItems = List.from(Utils.navBarItem.map((e) => e).toList());

    return Container(
      height: 78.h + MediaQuery.of(context).viewInsets.bottom,
      width: AppDimensions.size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: UIProps.bottomNavigationShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomItems
            .asMap()
            .entries
            .map(
              (e) => NavBarItem(
                data: e.value,
                index: e.key,
              ),
            )
            .toList(),
      ),
    );
  }
}
