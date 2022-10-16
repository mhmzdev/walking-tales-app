part of 'cubit.dart';

@immutable
class DomainState extends Equatable {
  final List<String>? data;
  final String? message;

  const DomainState({
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
class DomainDefault extends DomainState {}

@immutable
class DomainFetchLoading extends DomainState {
  const DomainFetchLoading() : super();
}

@immutable
class DomainFetchSuccess extends DomainState {
  const DomainFetchSuccess({List<String>? data}) : super(data: data);
}

@immutable
class DomainFetchFailed extends DomainState {
  const DomainFetchFailed({String? message}) : super(message: message);
}
