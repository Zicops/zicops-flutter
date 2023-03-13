import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/org_model.dart';
import '../../models/user_model.dart';
import '../../repositories/account_setup_repository.dart';

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
  }
}
