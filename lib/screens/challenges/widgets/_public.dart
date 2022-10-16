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
              style: AppText.h2b,
            ),
            Text(
              'Participate in challenges happening aroung you!',
              style: AppText.b2,
            ),
            Space.y1,
            const CustomTextField(
              name: 'search',
              hint: 'Type something...',
              prefixIcon: Icon(Icons.search),
              textInputType: TextInputType.text,
            ),
            Space.y1,
            for (int i = 0; i < 12; i++)
              WidgetAnimator(
                child: ChallengeCard(
                  challenge: Challenge(
                    isPublic: true,
                    uid: 'stea',
                    id: 'sdfsd',
                    participants: 2,
                    points: 23.22,
                    description:
                        'Driving students for maintaing physical health while they are in campus.',
                    title: 'Healthiest Campus of Islamabad',
                    startDate: DateTime.now(),
                    createdAt: DateTime.now(),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
