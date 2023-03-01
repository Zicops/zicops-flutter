import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zicops/models/cohort_details_model.dart';
import 'package:zicops/models/org_model.dart';

import '../../models/user_model.dart';
import '../../repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<AboutDetailsRequested>((event, emit) async {
      emit(AboutDetailsLoading());
      try {
        final userDetail = await profileRepository.getUserDetails();
        final orgDetail = await profileRepository.getOrgDetails();
        emit(AboutDetailsLoaded(user: userDetail, org: orgDetail));
      } catch (e) {
        emit(AboutDetailsError(message: e.toString()));
      }
    });
    on<CohortDetailsRequested>((event, emit) async {
      emit(CohortDetailsLoading());
      try {
        final cohortDetails = await profileRepository.getUserCohortDetails();
        emit(CohortDetailsLoaded(cohorts: cohortDetails));
      } catch (e) {
        emit(CohortDetailsError(message: e.toString()));
      }
    });
  }
}
