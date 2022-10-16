part of 'cubit.dart';

// fetch
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

// add
@immutable
class ChallengeAddState extends Equatable {
  static bool match(a, b) => a.Add != b.Add;

  final String? message;

  const ChallengeAddState({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

@immutable
class ChallengeAddDefault extends ChallengeAddState {}

@immutable
class ChallengeAddLoading extends ChallengeAddState {
  const ChallengeAddLoading() : super();
}

@immutable
class ChallengeAddSuccess extends ChallengeAddState {
  const ChallengeAddSuccess() : super();
}

@immutable
class ChallengeAddFailed extends ChallengeAddState {
  const ChallengeAddFailed({String? message}) : super(message: message);
}

// root-state
@immutable
class ChallengeState extends Equatable {
  final ChallengeFetchState? fetch;
  final ChallengeAddState? add;

  const ChallengeState({
    this.fetch,
    this.add,
  });

  @override
  List<Object?> get props => [
        fetch,
        add,
      ];

  ChallengeState copyWith({
    ChallengeAddState? add,
    ChallengeFetchState? fetch,
  }) {
    return ChallengeState(
      add: add ?? this.add,
      fetch: fetch ?? this.fetch,
    );
  }
}

@immutable
class ChallengeStateDefault extends ChallengeState {
  const ChallengeStateDefault()
      : super(
          add: const ChallengeAddState(),
          fetch: const ChallengeFetchState(),
        );
}
