import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(Unauthenticated()) {
    // When User Presses Login Button, we send a SignInRequested event to AuthBloc to handle and emit States - authenticated or unauthenticated
    on<SignInRequested>((event, emit) async {
      emit(Authenticating());
      try {
        final user = await authRepository.firebaseLogin(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated(user));
      } catch (e) {
        emit(AuthError(error: e.toString()));
        await Future.delayed(Duration(seconds: 5));
        emit(Unauthenticated());
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(Authenticating());
      await authRepository.logout();
      emit(Unauthenticated());
    });
  }
}
