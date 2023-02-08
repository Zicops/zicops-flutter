import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user/user_model.dart';
import '../../repo/user_repository.dart';
import '../app_states.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  // WeatherState get initialState {
  //   return super.initialState ?? WeatherInitial();
  // }

  // Make bloc initial state
  UserState get initialState => UserLoadingState();

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      final users = await _userRepository.getUserDetails();
      emit(UserLoadedState(users));
    });
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      final users = (json['users'] as List)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();
      _userRepository.userDetails = users;
      return UserLoadedState(users);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    if (state is UserLoadedState) {
      return state.toJson();
    } else {
      return null;
    }
  }
}
