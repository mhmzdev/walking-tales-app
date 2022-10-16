part of 'cubit.dart';

@immutable
class AuthState extends Equatable {
  final AuthData? data;
  final String? message;

  const AuthState({
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
class AuthDefault extends AuthState {}

@immutable
class AuthFetchLoading extends AuthState {
  const AuthFetchLoading() : super();
}

@immutable
class AuthFetchSuccess extends AuthState {
  const AuthFetchSuccess({AuthData? data}) : super(data: data);
}

@immutable
class AuthFetchFailed extends AuthState {
  const AuthFetchFailed({String? message}) : super(message: message);
}

// login
@immutable
class AuthLoginLoading extends AuthState {
  const AuthLoginLoading() : super();
}

@immutable
class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess({AuthData? data}) : super(data: data);
}

@immutable
class AuthLoginFailed extends AuthState {
  const AuthLoginFailed({String? message}) : super(message: message);
}

// register
@immutable
class AuthRegisterLoading extends AuthState {
  const AuthRegisterLoading() : super();
}

@immutable
class AuthRegisterSuccess extends AuthState {
  const AuthRegisterSuccess() : super();
}

@immutable
class AuthRegisterFailed extends AuthState {
  const AuthRegisterFailed({String? message}) : super(message: message);
}

// forgot
@immutable
class AuthForgotLoading extends AuthState {
  const AuthForgotLoading() : super();
}

@immutable
class AuthForgotSuccess extends AuthState {
  const AuthForgotSuccess({AuthData? data}) : super(data: data);
}

@immutable
class AuthForgotFailed extends AuthState {
  const AuthForgotFailed({String? message}) : super(message: message);
}

// init location
@immutable
class AuthInitLocationLoading extends AuthState {
  const AuthInitLocationLoading() : super();
}

@immutable
class AuthInitLocationSuccess extends AuthState {
  const AuthInitLocationSuccess({AuthData? data}) : super(data: data);
}

@immutable
class AuthInitLocationFailed extends AuthState {
  const AuthInitLocationFailed({String? message}) : super(message: message);
}

// profile complete
@immutable
class AuthProfileCompleteLoading extends AuthState {
  const AuthProfileCompleteLoading() : super();
}

@immutable
class AuthProfileCompleteSuccess extends AuthState {
  const AuthProfileCompleteSuccess({AuthData? data}) : super(data: data);
}

@immutable
class AuthProfileCompleteFailed extends AuthState {
  const AuthProfileCompleteFailed({String? message}) : super(message: message);
}

// gmail
@immutable
class AuthGmailLoading extends AuthState {
  const AuthGmailLoading() : super();
}

@immutable
class AuthGmailSuccess extends AuthState {
  const AuthGmailSuccess({AuthData? data}) : super(data: data);
}

@immutable
class AuthGmailFailed extends AuthState {
  const AuthGmailFailed({String? message}) : super(message: message);
}

// logout
@immutable
class AuthLogoutLoading extends AuthState {
  const AuthLogoutLoading() : super();
}

@immutable
class AuthLogoutSuccess extends AuthState {
  const AuthLogoutSuccess({AuthData? data}) : super(data: data);
}

@immutable
class AuthLogoutFailed extends AuthState {
  const AuthLogoutFailed({String? message}) : super(message: message);
}
