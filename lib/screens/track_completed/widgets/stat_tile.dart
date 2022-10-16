part of "stats_card.dart";

class _StatTile extends StatelessWidget {
  final String? title;
  final String? value;
  const _StatTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title!,
          style: AppText.h3b.cl(AppTheme.c.primaryDark!).copyWith(fontSize: 16),
        ),
        Text(
          value!,
          style: AppText.h3bm.cl(AppTheme.c.primaryDark!),
        ),
      ],
    );
  }
}
