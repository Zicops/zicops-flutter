import 'package:mobx/mobx.dart';
import 'package:zicops/models/user/user_details_model.dart';

part 'mobx_store.g.dart';

class ZStore = _ZStore with _$ZStore;

abstract class _ZStore with Store {
  @observable
  late UserDetailsModel userDetailsModel;
}