
part of 'cubit.dart';

@immutable
class DietState extends Equatable {
  final Diet? data;
  final String? message;

  const DietState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message,];
}

@immutable
class DietDefault extends DietState {}

@immutable
class DietFetchLoading extends DietState {
    const DietFetchLoading(): super();
}

@immutable
class DietFetchSuccess extends DietState {
    const DietFetchSuccess({Diet? data}): super(data: data);
}

@immutable
class DietFetchFailed extends DietState {
    const DietFetchFailed({String? message}): super(message: message);
}