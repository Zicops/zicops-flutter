part of 'account_setup_bloc.dart';

@immutable
abstract class AccountSetupEvent extends Equatable {
  const AccountSetupEvent();
  @override
  List<Object?> get props => [];
}

class PersonalTabRequested extends AccountSetupEvent {
  const PersonalTabRequested();
}

class UpdatePersonalDetailsRequested extends AccountSetupEvent {
  const UpdatePersonalDetailsRequested();
}

class UpdatePersonalDetailsSuccess extends AccountSetupEvent {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final MultipartFile? image;
  const UpdatePersonalDetailsSuccess({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.image,
  });
}

class OrgTabRequested extends AccountSetupEvent {
  const OrgTabRequested();
}

class PreferencesTabRequested extends AccountSetupEvent {
  const PreferencesTabRequested();
}
