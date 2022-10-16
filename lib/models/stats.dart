// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Stats {
  int? id;
  DateTime? checkedInAt;
  int? userStepCount;
  double? speed = 0;
  double? distanceTraveled = 0;
  int? caloriesBurned;
  List<LatLng>? polyCoordinates;

  Stats({
    required this.id,
    required this.checkedInAt,
    required this.userStepCount,
    required this.speed,
    required this.distanceTraveled,
    required this.caloriesBurned,
    required this.polyCoordinates,
  });

  Stats copyWith({
    int? id,
    DateTime? checkedInAt,
    int? userStepCount,
    double? speed,
    double? distanceTraveled,
    int? caloriesBurned,
    List<LatLng>? polyCoordinates,
  }) {
    return Stats(
      id: id ?? this.id,
      checkedInAt: checkedInAt ?? this.checkedInAt,
      userStepCount: userStepCount ?? this.userStepCount,
      speed: speed ?? this.speed,
      distanceTraveled: distanceTraveled ?? this.distanceTraveled,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      polyCoordinates: polyCoordinates ?? this.polyCoordinates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'checkedInAt': checkedInAt?.millisecondsSinceEpoch,
      'userStepCount': userStepCount,
      'speed': speed,
      'distanceTraveled': distanceTraveled,
      'caloriesBurned': caloriesBurned,
      'polyCoordinates': polyCoordinates!
          .map((x) => {"lat": x.latitude, "lng": x.longitude})
          .toList(),
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      id: map['id'] != null ? map['id'] as int : null,
      checkedInAt: map['checkedInAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['checkedInAt'] as int)
          : null,
      userStepCount:
          map['userStepCount'] != null ? map['userStepCount'] as int : null,
      speed: map['speed'] != null ? map['speed'] as double : null,
      distanceTraveled: map['distanceTraveled'] != null
          ? map['distanceTraveled'] as double
          : null,
      caloriesBurned:
          map['caloriesBurned'] != null ? map['caloriesBurned'] as int : null,
      polyCoordinates: map['polyCoordinates'] != null
          ? List<LatLng>.from(
              (map['polyCoordinates'] as List<dynamic>)
                  .map<LatLng?>((x) => LatLng((x as Map)["lat"], (x)["lng"])),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) =>
      Stats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Stats(id: $id, checkedInAt: $checkedInAt, userStepCount: $userStepCount, speed: $speed, distanceTraveled: $distanceTraveled, caloriesBurned: $caloriesBurned, polyCoordinates: $polyCoordinates)';
  }

  @override
  bool operator ==(covariant Stats other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.checkedInAt == checkedInAt &&
        other.userStepCount == userStepCount &&
        other.speed == speed &&
        other.distanceTraveled == distanceTraveled &&
        other.caloriesBurned == caloriesBurned &&
        listEquals(other.polyCoordinates, polyCoordinates);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        checkedInAt.hashCode ^
        userStepCount.hashCode ^
        speed.hashCode ^
        distanceTraveled.hashCode ^
        caloriesBurned.hashCode ^
        polyCoordinates.hashCode;
  }
}
