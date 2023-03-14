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

class OrgTabRequested extends AccountSetupEvent {
  const OrgTabRequested();
}