part of 'cubit.dart';

class ChallengeRepository {
  Future<List<Challenge>> fetch([Map<String, dynamic>? map]) =>
      ChallengeDataProvider.fetch(map);
}
