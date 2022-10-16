import 'package:flutter/material.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/models/challenge.dart';
import 'package:walking_tales/widgets/buttons/app_button.dart';
import 'package:walking_tales/widgets/dividers/app_dividers.dart';

class ChallengeDetailScreen extends StatelessWidget {
  const ChallengeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final challenge = args['challenge'] as Challenge;
    final themeColor = args['color'] as Color;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
      ),
      body: SingleChildScrollView(
        padding: Space.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              challenge.title,
              style: AppText.h1b,
            ),
            AppDividers.simple(context),
            Text(
              'Description',
              style: AppText.b2b.cl(Colors.grey),
            ),
            Space.y,
            Text(
              challenge.description,
              style: AppText.b1,
            ),
            AppDividers.simple(context),
            Text(
              'Number of Participants',
              style: AppText.b2b.cl(Colors.grey),
            ),
            Space.y,
            Text(
              challenge.participants.toString(),
              style: AppText.b1,
            ),
            Space.y1,
            Text(
              'Entry fee (Points):',
              style: AppText.b2b.cl(Colors.grey),
            ),
            Space.y,
            Text(
              '${challenge.points.round().toString()}/person',
              style: AppText.b1,
            ),
            AppDividers.simple(context),
            AppButton(
              color: themeColor,
              onPressed: () {},
              child: Text(
                'Start challenge',
                style: AppText.b1b.cl(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
