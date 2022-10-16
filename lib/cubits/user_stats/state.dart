part of 'cubit.dart';

@immutable
class UserStatsState extends Equatable {
  final List<Stats>? data;
  final int? totalSteps;
  final int? totalCaloriesBurned;
  final double? distanceTraveled;
  final double? averageSpeed;
  final String? message;

  const UserStatsState({
    this.data,
    this.distanceTraveled,
    this.totalCaloriesBurned,
    this.totalSteps,
    this.averageSpeed,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class UserStatsDefault extends UserStatsState {}

@immutable
class UserStatsFetchLoading extends UserStatsState {
  const UserStatsFetchLoading() : super();
}

@immutable
class UserStatsFetchSuccess extends UserStatsState {
  const UserStatsFetchSuccess(
      {List<Stats>? data,
      int? totalCaloriesBurned,
      int? totalSteps,
      double? distanceTraveled,
      double? averageSpeed})
      : super(
            data: data,
            totalCaloriesBurned: totalCaloriesBurned,
            totalSteps: totalSteps,
            distanceTraveled: distanceTraveled,
            averageSpeed: averageSpeed);
}

@immutable
class UserStatsFetchFailed extends UserStatsState {
  const UserStatsFetchFailed({String? message}) : super(message: message);
}
