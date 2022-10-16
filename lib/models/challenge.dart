import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge {
  final String id;
  final String uid;
  final String title;
  final String description;
  final int participants;
  final double points;
  final DateTime startDate;
  final String? imageUrl;
  final DateTime createdAt;
  final bool isPublic;
  Challenge({
    required this.uid,
    required this.id,
    required this.title,
    required this.description,
    required this.participants,
    required this.points,
    required this.startDate,
    this.imageUrl,
    required this.createdAt,
    required this.isPublic,
  });

  Challenge copyWith({
    String? uid,
    String? id,
    String? title,
    String? description,
    int? participants,
    double? points,
    DateTime? startDate,
    String? imageUrl,
    DateTime? createdAt,
    bool? isPublic,
  }) {
    return Challenge(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      participants: participants ?? this.participants,
      points: points ?? this.points,
      startDate: startDate ?? this.startDate,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      isPublic: isPublic ?? this.isPublic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'uid': uid,
      'description': description,
      'participants': participants,
      'points': points,
      'startDate': startDate,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'isPublic': isPublic,
    };
  }

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return Challenge(
      id: map['id'] as String,
      uid: map['uid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      participants: int.parse(map['participants'].toString()),
      points: double.parse(map['points'].toString()),
      startDate: (map['startDate'] as Timestamp).toDate(),
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      isPublic: map['isPublic'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Challenge.fromJson(String source) =>
      Challenge.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Challenge(id: $id, title: $title, description: $description, participants: $participants, points: $points, startDate: $startDate, imageUrl: $imageUrl, createdAt: $createdAt, isPublic: $isPublic)';
  }

  @override
  bool operator ==(covariant Challenge other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.participants == participants &&
        other.points == points &&
        other.startDate == startDate &&
        other.imageUrl == imageUrl &&
        other.createdAt == createdAt &&
        other.isPublic == isPublic;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        participants.hashCode ^
        points.hashCode ^
        startDate.hashCode ^
        imageUrl.hashCode ^
        createdAt.hashCode ^
        isPublic.hashCode;
  }
}
