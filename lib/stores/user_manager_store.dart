import 'package:artisan/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:artisan/models/user_model.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  _UserManagerStore() {
    _getCurrentUser();
  }

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepo().currentUser();
    setUser(user);
  }
}
