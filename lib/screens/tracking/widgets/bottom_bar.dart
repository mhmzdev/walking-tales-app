part of "../tracking.dart";

class _BottomBar extends StatefulWidget {
  final VoidCallback? onButtonPress;
  const _BottomBar({Key? key, this.onButtonPress}) : super(key: key);

  @override
  State<_BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<_BottomBar> {
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context, listen: true);
    return Padding(
      padding: Space.all(15, 15),
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              onPressed: () {
                app.setTrackingStatus = !app.isTrackingStarted;
                widget.onButtonPress!();
              },
              child: Text(
                app.isTrackingStarted ? "End Tracking" : "Start Counting",
                style: AppText.h3b.cl(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
