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

// For Preferences of Home Screen Drawer
class SelectedPreferenceLoading extends AccountSetupState {
  @override
  List<Object?> get props => [];
}

class SelectedPreferenceLoaded extends AccountSetupState {
  final List<String> selectedSubCategories;
  final String baseCategory;
  final List<Category> subCategories;
  SelectedPreferenceLoaded(
      this.selectedSubCategories, this.baseCategory, this.subCategories);

  @override
  List<Object> get props => [selectedSubCategories, baseCategory];
}

class SelectedPreferenceError extends AccountSetupState {
  final String message;

  SelectedPreferenceError({required this.message});

  @override
  List<Object> get props => [message];
}
