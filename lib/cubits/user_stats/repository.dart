part of 'cubit.dart';

class UserStatsRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> fetch() => UserStatsDataProvider.fetch();

  Future<void> submitStats(Stats stats) async =>
     await  UserStatsDataProvider.submitStats(stats);
}
