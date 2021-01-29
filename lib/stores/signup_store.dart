import 'package:artisan/helpers/invoke_error.dart';
import 'package:artisan/models/user_model.dart';
import 'package:artisan/repositories/user_repository.dart';
import 'package:artisan/stores/user_manager_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:artisan/helpers/extensions.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;

  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return "Nome muito curto";
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return "E-mail Inválido";
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;

  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return "Campo obrigatório";
    else
      return "Número Inválido";
  }

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1valid => pass1 != null && pass1.length >= 6;

  String get pass1Error {
    if (pass1 == null || pass1valid)
      return null;
    else if (pass1.isEmpty)
      return "Campo obrigatório";
    else
      return "Senha muito curta";
  }

  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2valid => pass1 != null && pass2 == pass1;

  String get pass2Error {
    if (pass2 == null || pass2valid)
      return null;
    else if (pass2 != pass1)
      return "Senhas não coincidem";
    else
      return "Número inválido";
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && pass1valid && pass2valid && phoneValid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;
    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: pass1,
    );

    try {
      final resultUser = await UserRepo().signUp(user);
      print(resultUser);
      GetIt.I<UserManagerStore>().setUser(resultUser);
    } catch (e) {
      error = e;
      print(error);

    }
      loading = false;

  }
  @observable
  bool showAlert = false;



}
