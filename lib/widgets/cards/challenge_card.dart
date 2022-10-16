import 'package:flutter/material.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/models/challenge.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;
  final Color? shadowColor;

  const ChallengeCard({
    Key? key,
    required this.challenge,
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
                  challenge.title,
                  style: AppText.b1b.copyWith(
                    color: AppTheme.c.primaryDark,
                    fontSize: AppDimensions.font(8),
                  ),
                ),
                Text(
                  challenge.description,
                  style: AppText.l1.cl(Colors.grey),
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
