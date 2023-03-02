import 'package:mobx/mobx.dart';
import 'package:zicops/models/user/user_details_model.dart';

part 'mobx_store.g.dart';

class ZStore = _ZStore with _$ZStore;

abstract class _ZStore with Store {
  @observable
  UserDetailsModel userDetailsModel = UserDetailsModel(
    'id',
    'firstName',
    'lastName',
    'status',
    'role',
    false,
    false,
    'gender',
    'email',
    'phone',
    'photoUrl',
    'userLSPId',
  );

  @action
  void setUserDetails(UserDetailsModel userDetails) {
    userDetailsModel = userDetails;
  }
}
