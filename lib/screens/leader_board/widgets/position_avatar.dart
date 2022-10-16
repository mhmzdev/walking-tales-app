import 'package:flutter/material.dart';
import 'package:walking_tales/configs/configs.dart';

class PositionAvatar extends StatelessWidget {
  final String? url;
  final int? position;
  const PositionAvatar({Key? key, required this.url, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: position == 1 ? 120 : 90,
        width: position == 1 ? 110 : 80,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                shape: const CircleBorder(),
                elevation: 5,
                child: Padding(
                  padding: Space.all(2, 2),
                  child: CircleAvatar(
                    radius: position == 1 ? 55 : 40,
                    backgroundImage: NetworkImage(url!),
                    // backgroundImage: NetworkImage(url!),
                    backgroundColor: Colors.grey[200],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 40,
                width: 40,
                child: Card(
                    shape: const CircleBorder(),
                    elevation: 5,
                    child: Center(
                      child: Text(
                        position.toString(),
                        style: AppText.b1b
                            .cl(
                              AppTheme.c.primaryDark!,
                            )
                            .copyWith(
                              fontSize: 16,
                            ),
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}
