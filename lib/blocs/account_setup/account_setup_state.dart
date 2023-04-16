part of 'account_setup_bloc.dart';

@immutable
abstract class AccountSetupState extends Equatable {}

class AccountSetupInitial extends AccountSetupState {
  @override
  List<Object?> get props => [];
}

// For Personal Tab of account setup page
class PersonalTabLoading extends AccountSetupState {
  @override
  List<Object?> get props => [];
}

class PersonalTabLoaded extends AccountSetupState {
  final UserModel user;

  PersonalTabLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUser extends AccountSetupState {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final MultipartFile? image;

  UpdateUser(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      this.image});

  @override
  List<Object?> get props => [id, firstName, lastName, email, phone, image];
}

class PersonalTabError extends AccountSetupState {
  final String message;

  PersonalTabError({required this.message});

  @override
  List<Object> get props => [message];
}

// For Organisation Tab of account setup page
class OrganisationTabLoading extends AccountSetupState {
  @override
  List<Object?> get props => [];
}

class OrganisationTabLoaded extends AccountSetupState {
  final OrgModel org;

  OrganisationTabLoaded(this.org);

  @override
  List<Object> get props => [org];
}

class OrganisationTabError extends AccountSetupState {
  final String message;

  OrganisationTabError({required this.message});

  @override
  List<Object> get props => [message];
}

// For Preferences Tab of account setup page
class PreferencesTabLoading extends AccountSetupState {
  @override
  List<Object?> get props => [];
}

class PreferencesTabLoaded extends AccountSetupState {
  final List<Category> categories;
  final List<Category> subCategories;

  PreferencesTabLoaded(this.categories, this.subCategories);

  @override
  List<Object> get props => [];
}

class PreferencesTabError extends AccountSetupState {
  final String message;

  PreferencesTabError({required this.message});

  @override
  List<Object> get props => [message];
}
