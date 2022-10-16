import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/screens/leader_board/widgets/position_avatar.dart';
import 'package:walking_tales/utils/utils.dart';
import 'package:walking_tales/widgets/_animated_toggle_switcher.dart';

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppTheme.c.primaryDark,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          height: AppDimensions.size.height * 0.4,
          width: AppDimensions.size.width,
          child: Stack(
            children: [
              Center(
                child: Row(
                  children: [
                    Expanded(
                        child: Lottie.asset("assets/animations/confetti.json")),
                    Expanded(
                        child: Lottie.asset("assets/animations/confetti.json")),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      3,
                      (index) => PositionAvatar(
                            url: Utils.leaderboardWinners[index].url,
                            position: index == 0
                                ? 2
                                : index == 1
                                    ? 1
                                    : 3,
                          )),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/2545/2545603.png",
                    height: 36,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.scale(
                      scale: 0.7, child: const AnimatedToggleSwitcher()))
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: Utils.leaderboardItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape:
                        RoundedRectangleBorder(borderRadius: UIProps.radiusM),
                    margin: Space.all(15, 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            NetworkImage(Utils.leaderboardItems[index].url!),
                      ),
                      title: Text(
                        Utils.leaderboardItems[index].name!,
                        style: AppText.b1bm,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Utils.leaderboardItems[index].steps.toString()),
                          Space.x,
                          Image.asset(
                            "assets/footsteps.png",
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ],
    ));
  }
}
