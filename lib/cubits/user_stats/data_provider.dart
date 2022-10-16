part of 'cubit.dart';

class UserStatsDataProvider {
  static final firestore = FirebaseFirestore.instance;
  static final user = FirebaseAuth.instance.currentUser;
  static final testUserCollection =
      firestore.collection("testUser").doc("123").collection("stats");
  static Stream<QuerySnapshot<Map<String, dynamic>>> fetch() {
    try {
      return testUserCollection.snapshots().asBroadcastStream();
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<void> submitStats(Stats stats) async {
    //  return testUserCollection.snapshots().asBroadcastStream();

    await testUserCollection.doc(stats.id.toString()).set(stats.toMap());
  }
}
