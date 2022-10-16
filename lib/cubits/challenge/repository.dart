part of 'cubit.dart';

class ChallengeRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> fetch() =>
      ChallengeDataProvider.fetch();

  Future<void> add(Challenge challenge) =>
      ChallengeDataProvider.add(challenge.toMap());
}
