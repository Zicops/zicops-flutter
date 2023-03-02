part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

// For About Tab of profile page
class AboutDetailsLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class AboutDetailsLoaded extends ProfileState {
  final UserModel user;
  final OrgModel org;

  AboutDetailsLoaded({required this.user, required this.org});

  @override
  List<Object> get props => [user, org];
}

class AboutDetailsError extends ProfileState {
  final String message;

  AboutDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}

// For Cohort Tab of profile page

class CohortDetailsLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class CohortDetailsLoaded extends ProfileState {
  final List<CohortDetailsModel> cohorts;

  CohortDetailsLoaded({required this.cohorts});

  @override
  List<Object> get props => [cohorts];
}

class CohortDetailsError extends ProfileState {
  final String message;

  CohortDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}

// // 2. User Organization
// class UserOrganizationLoading extends ProfileState {
//   @override
//   List<Object> get props => [];
// }
//
// class UserOrganizationLoaded extends ProfileState {
//   final OrgModel org;
//
//   UserOrganizationLoaded({required this.org});
//
//   @override
//   List<Object> get props => [org];
// }
//
// class UserOrganizationError extends ProfileState {
//   final String message;
//
//   UserOrganizationError({required this.message});
//
//   @override
//   List<Object> get props => [message];
// }
