import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:walking_tales/animations/bottom_animation.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/challenge/cubit.dart';
import 'package:walking_tales/models/challenge.dart';
import 'package:walking_tales/utils/static_utils.dart';
import 'package:walking_tales/widgets/buttons/app_button.dart';
import 'package:walking_tales/widgets/cards/challenge_card.dart';
import 'package:walking_tales/widgets/dividers/app_dividers.dart';
import 'package:walking_tales/widgets/text_fields/custom_text_field.dart';

part 'widgets/_public.dart';
part 'widgets/_friends.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  @override
  void initState() {
    super.initState();

    ChallengeCubit.c(context).fetch();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh_rounded,
                ),
              ),
              Space.x1,
            ],
            backgroundColor: DefaultTabController.of(context)?.index == 0
                ? AppTheme.c.primary
                : Colors.green,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              onTap: (value) {
                setState(() {
                  DefaultTabController.of(context)?.index = value;
                });
              },
              tabs: [
                Padding(
                  padding: Space.v,
                  child: Text(
                    'Public',
                    style: AppText.b1b,
                  ),
                ),
                Padding(
                  padding: Space.v,
                  child: Text(
                    'Friends',
                    style: AppText.b1b,
                  ),
                ),
              ],
            ),
          ),
          body: const SafeArea(
            top: false,
            bottom: true,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                _Public(),
                _Friends(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
