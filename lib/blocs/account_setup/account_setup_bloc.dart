import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/org_model.dart';
import '../../models/user_model.dart';
import '../../repositories/account_setup_repository.dart';
import '../../views/screens/account_setup/models/category.dart';

part 'account_setup_event.dart';
part 'account_setup_state.dart';

class AccountSetupBloc extends Bloc<AccountSetupEvent, AccountSetupState> {
  final AccountSetupRepository accountSetupRepository;
  AccountSetupBloc(this.accountSetupRepository) : super(AccountSetupInitial()) {
    on<PersonalTabRequested>((event, emit) async {
      emit(PersonalTabLoading());
      try {
        final userDetail = await accountSetupRepository.getPersonalDetails();
        emit(PersonalTabLoaded(userDetail));
      } catch (e) {
        emit(PersonalTabError(message: e.toString()));
      }
    });
    on<OrgTabRequested>((event, emit) async {
      emit(OrganisationTabLoading());
      try {
        final orgDetail = await accountSetupRepository.getOrgDetails();
        emit(OrganisationTabLoaded(orgDetail));
      } catch (e) {
        emit(OrganisationTabError(message: e.toString()));
      }
    });
    on<PreferencesTabRequested>((event, emit) async {
      emit(PreferencesTabLoading());
      try {
        final categories = await accountSetupRepository.getAllCatMain();
        final subCategories = await accountSetupRepository.getAllSubCatMain();
        emit(PreferencesTabLoaded(categories, subCategories));
      } catch (e) {
        emit(PreferencesTabError(message: e.toString()));
      }
    });
    on<SelectedPreferenceRequested>((event, emit) async {
      emit(SelectedPreferenceLoading());
      try {
        final selectedPreferences =
            await accountSetupRepository.getSelectedPreferences();
        print(selectedPreferences[1]);
        emit(SelectedPreferenceLoaded(
            selectedPreferences[0], selectedPreferences[1]));
      } catch (e) {
        emit(SelectedPreferenceError(message: e.toString()));
      }
    });
  }
}
