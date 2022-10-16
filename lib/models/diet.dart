import 'dart:convert';

import 'package:flutter/foundation.dart';

class Diet {
  final List<String> exercises;
  final List<String> food;
  final String message;
  Diet({
    required this.exercises,
    required this.food,
    required this.message,
  });

  Diet copyWith({
    List<String>? exercises,
    List<String>? food,
    String? message,
  }) {
    return Diet(
      exercises: exercises ?? this.exercises,
      food: food ?? this.food,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'exercises': exercises,
      'food': food,
      'message': message,
    };
  }

  factory Diet.fromMap(List list) {
    return Diet(
      exercises:List<String>.from( list.first),
      food: List<String>.from(list[1]),
      message: list.last,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'Diet(exercises: $exercises, food: $food, message: $message)';

  @override
  bool operator ==(covariant Diet other) {
    if (identical(this, other)) return true;

    return listEquals(other.exercises, exercises) &&
        listEquals(other.food, food) &&
        other.message == message;
  }

  @override
  int get hashCode => exercises.hashCode ^ food.hashCode ^ message.hashCode;
}
