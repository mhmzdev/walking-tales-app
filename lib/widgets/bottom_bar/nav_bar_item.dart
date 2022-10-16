import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';
import '../../models/nav_bar_item_model.dart';
import '../../providers/app_provider.dart';

class NavBarItem extends StatelessWidget {
  final NavbarItemModel data;
  final int index;
  const NavBarItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProv = Provider.of<AppProvider>(context);

    return Expanded(
      child: InkWell(
        onTap: () => appProv.setBottomIndex(index),
        child: Center(
          child: appProv.bottomIndex != index
              ? Padding(
                  padding: Space.all(5),
                  child: data.icon,
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DelayedDisplay(
                      slidingBeginOffset: const Offset(0, -2),
                      child: Text(
                        data.label,
                        style: AppText.b2.copyWith(
                          color: AppTheme.c.accent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Space.yf(3),
                    DelayedDisplay(
                      slidingBeginOffset: const Offset(0, 2),
                      child: Container(
                        margin: Space.all(0.2),
                        height: AppDimensions.normalize(2.25),
                        width: AppDimensions.normalize(2.25),
                        decoration: BoxDecoration(
                          color: AppTheme.c.accent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
