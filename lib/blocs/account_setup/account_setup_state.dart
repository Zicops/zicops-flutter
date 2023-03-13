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
