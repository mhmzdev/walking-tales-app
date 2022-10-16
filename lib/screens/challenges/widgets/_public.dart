part of '../challenges.dart';

class _Public extends StatelessWidget {
  const _Public({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: Space.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Public challenges',
              style: AppText.h1b,
            ),
            Text(
              'Participate in challenges happening aroung you!',
              style: AppText.b2,
            ),
            Space.y1,
            for (int i = 0; i < 12; i++)
              const WidgetAnimator(
                child: ChallengeCard(),
              )
          ],
        ),
      ),
    );
  }
}
