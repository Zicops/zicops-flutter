part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
  Map<String, dynamic>? toJson() {}
}

// class InitialSettingsState extends SettingsState {
//   InitialSettingsState()
//       : super(sliderFontSize: 0.5, isBold: false, isItalic: false);
// }

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);

  @override
  List<Object?> get props => [users];

  Map<String, dynamic>? toJson() {
    return {
      'users': users.map((e) => e.toJson()).toList(),
    };
  }
}

// class UserErrorState extends UserState {
//   final String error;
//   UserErrorState(this.error);
//   @override
//   List<Object?> get props => [error];
// }
