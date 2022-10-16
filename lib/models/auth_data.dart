import 'dart:convert';

class AuthData {
  final String uid;
  final String fullName;
  final String email;
  final String imageUrl;
  final String gender;
  final int age;
  final double weight;
  final double height;
  AuthData({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
  });

  AuthData copyWith({
    String? uid,
    String? fullName,
    String? email,
    String? imageUrl,
    String? gender,
    int? age,
    double? weight,
    double? height,
  }) {
    return AuthData(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'imageUrl': imageUrl,
      'gender': gender,
      'age': age,
      'weight': weight,
      'height': height,
    };
  }

  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      uid: map['uid'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String,
      gender: map['gender'] as String,
      age: map['age'] as int,
      weight: double.parse(map['weight'].toString()),
      height: double.parse(map['height'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthData.fromJson(String source) =>
      AuthData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthData(uid: $uid, fullName: $fullName, email: $email, imageUrl: $imageUrl, gender: $gender, age: $age, weight: $weight, height: $height)';
  }

  @override
  bool operator ==(covariant AuthData other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.fullName == fullName &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.gender == gender &&
        other.age == age &&
        other.weight == weight &&
        other.height == height;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        imageUrl.hashCode ^
        gender.hashCode ^
        age.hashCode ^
        weight.hashCode ^
        height.hashCode;
  }
}
