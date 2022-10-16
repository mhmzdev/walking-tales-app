import 'package:flutter/material.dart';
import 'package:walking_tales/animations/bottom_animation.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/widgets/cards/challenge_card.dart';

part 'widgets/_public.dart';
part 'widgets/_friends.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
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
      ),
    );
  }
}
