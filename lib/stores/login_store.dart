import 'package:artisan/repositories/user_repository.dart';
import 'package:artisan/stores/user_manager_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:artisan/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {});
  }

  @observable
  bool passwordVisible = false;

  @action
  void TogglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String get emailError =>
      email == null || emailValid ? null : 'E-mail inválido';

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 4;

  String get passwordError =>
      password == null || passwordValid ? null : 'Senha inválida';

  @computed
  Function get loginPressed => emailValid && passwordValid ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;
    try {
      final user = await UserRepo().loginWithEmail(email, password);
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
