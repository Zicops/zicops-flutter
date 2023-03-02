part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}

class AboutDetailsRequested extends ProfileEvent {
  const AboutDetailsRequested();
}

class CohortDetailsRequested extends ProfileEvent {
  const CohortDetailsRequested();
}
