part of 'account_setup_bloc.dart';

@immutable
abstract class AccountSetupEvent extends Equatable {
  const AccountSetupEvent();
  @override
  List<Object?> get props => [];
}

/// For Account Setup Pages
class PersonalTabRequested extends AccountSetupEvent {
  const PersonalTabRequested();
}

class OrgTabRequested extends AccountSetupEvent {
  const OrgTabRequested();
}

class PreferencesTabRequested extends AccountSetupEvent {
  const PreferencesTabRequested();
}

/// For Home Screen drawer
class SelectedPreferenceRequested extends AccountSetupEvent {
  const SelectedPreferenceRequested();
}
