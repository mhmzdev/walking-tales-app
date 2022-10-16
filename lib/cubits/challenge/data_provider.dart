part of 'cubit.dart';

class ChallengeDataProvider {
  static final firebase = FirebaseFirestore.instance;
  static final challenges = firebase.collection('challenges');

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetch() {
    try {
      final stream = challenges.snapshots();
      return stream;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> add(Map<String, dynamic> map) async {
    try {
      await challenges.doc(map['id']).set(map);
    } catch (e) {
      throw e.toString();
    }
  }
}
