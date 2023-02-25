import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(Unauthenticated()) {
    // When User Presses Login Button, we send a SignInRequested event to AuthBloc to handle and emit States - authenticated or unauthenticated
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.firebaseLogin(
          email: event.email,
          password: event.password,
        );
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(Unauthenticated());
      }
    });
  }
}
