import 'package:flutter/material.dart';
import 'package:walking_tales/configs/configs.dart';

class StepCounter extends StatelessWidget {
  final int? userSteps;
  const StepCounter({Key? key, this.userSteps = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      reverseDuration: const Duration(
        milliseconds: 200,
      ),
      duration: const Duration(
        milliseconds: 800,
      ),
      child: userSteps != 0
          ? Padding(
              padding: Space.all(10),
              child: SizedBox(
                // width: 80,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: UIProps.radiusS),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.numbers),
                        Text(
                          userSteps.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
