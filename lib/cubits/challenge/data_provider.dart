part of 'cubit.dart';

class ChallengeDataProvider {
  static Future<List<Challenge>> fetch([Map<String, dynamic>? map]) async {
    try {
      final Map<String, dynamic> raw = map!;
      return [Challenge.fromMap(raw)];
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
