part of 'cubit.dart';

class DomainDataProvider {
  static Stream<DocumentSnapshot<Map<String, dynamic>>> fetch() {
    try {
      final stream = FirebaseFirestore.instance
          .collection('domains')
          .doc('data')
          .snapshots();
      return stream;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
