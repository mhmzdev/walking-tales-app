import 'package:flutter/material.dart';
import 'package:walking_tales/configs/configs.dart';

class ChallengeCard extends StatelessWidget {
  final Color? shadowColor;

  const ChallengeCard({
    Key? key,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: UIProps.boxCard!,
      padding: Space.all(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: shadowColor ?? AppTheme.c.primary,
            child: Text(
              'ISB',
              style: AppText.b1b.cl(
                Colors.white,
              ),
            ),
          ),
          Space.x,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Healthiest University in Islamabad',
                  style: AppText.b1b.copyWith(
                    color: AppTheme.c.primaryDark,
                    fontSize: AppDimensions.font(8),
                  ),
                ),
                Text(
                  'Driving students for maintaing physical health while they are in campus.',
                  style: AppText.l1.cl(Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
