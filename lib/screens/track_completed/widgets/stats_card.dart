import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/providers/app_provider.dart';

part 'stat_tile.dart';

class StatsCard extends StatefulWidget {
  const StatsCard({Key? key}) : super(key: key);

  @override
  State<StatsCard> createState() => _StatsCardState();
}

class _StatsCardState extends State<StatsCard> {
  List<String> titles = [
    "Km",
    "Cal",
    "Speed",
  ];

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIProps.radiusXL,
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey[200]!, spreadRadius: 4, blurRadius: 10)
          ]),
      child: SizedBox(
        width: AppDimensions.size.width,
        child: Padding(
          padding: Space.all(0, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                3,
                (index) => _StatTile(
                      title: titles[index],
                      value: app.getAppropriateValue(index),
                    )),
          ),
        ),
      ),
    );
  }
}
