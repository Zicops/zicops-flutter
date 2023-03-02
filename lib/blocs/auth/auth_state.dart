part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

// When User Presses Login Button, the state will be changed to Loading
class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// When authentication is successful, the state will be changed to Authenticated
class Authenticated extends AuthState {
  final UserModel userModel;

  Authenticated(this.userModel);
  @override
  List<Object?> get props => [];
}

// Initial State of bloc when user is unauthenticated
class Unauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// Any Error that occurs during authentication will be handled by this state
class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});

  @override
  List<Object?> get props => [error];
}
