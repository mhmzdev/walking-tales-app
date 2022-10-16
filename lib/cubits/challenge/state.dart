part of 'cubit.dart';

@immutable
class ChallengeFetchState extends Equatable {
  static bool match(a, b) => a.fetch != b.fetch;

  final List<Challenge>? data;
  final String? message;

  const ChallengeFetchState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class ChallengeFetchDefault extends ChallengeFetchState {}

@immutable
class ChallengeFetchLoading extends ChallengeFetchState {
  const ChallengeFetchLoading() : super();
}

@immutable
class ChallengeFetchSuccess extends ChallengeFetchState {
  const ChallengeFetchSuccess({List<Challenge>? data}) : super(data: data);
}

@immutable
class ChallengeFetchFailed extends ChallengeFetchState {
  const ChallengeFetchFailed({String? message}) : super(message: message);
}

// root-state
@immutable
class ChallengeState extends Equatable {
  final ChallengeFetchState? fetch;

  const ChallengeState({
    this.fetch,
  });

  @override
  List<Object?> get props => [
        fetch,
      ];

  ChallengeState copyWith({
    ChallengeFetchState? fetch,
  }) {
    return ChallengeState(
      fetch: fetch ?? this.fetch,
    );
  }
}

@immutable
class ChallengeStateDefault extends ChallengeState {
  const ChallengeStateDefault()
      : super(
          fetch: const ChallengeFetchState(),
        );
}
