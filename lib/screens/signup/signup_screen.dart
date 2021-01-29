import 'package:artisan/components/customtextfield/custom_icon_button.dart';
import 'package:artisan/components/customtextfield/custom_text_field.dart';
import 'package:artisan/helpers/error_box.dart';
import 'package:artisan/helpers/error_popup.dart';
import 'package:artisan/screens/login/login_screen.dart';
import 'package:artisan/screens/signup/componentes/field_title.dart';
import 'package:artisan/stores/signup_store.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Observer(builder: (_){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ErrorPopup(message: signupStore.error),
                        );
                      })
                      ,

                      FieldTitle(
                        title: "Apelido",
                        subtitle: "Como aparecerá em seus anúncios",
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !signupStore.loading,
                          hint: "Ex: Mateus B.",
                          onChanged: signupStore.setName,
                          errorText: signupStore.nameError,
                        );
                      }),
                      SizedBox(height: 16),
                      FieldTitle(
                        title: "E-mail",
                        subtitle: "Enviaremos um e-mail de verificação",
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !signupStore.loading,
                          onChanged: signupStore.setEmail,
                          hint: "mateusito@gmail.com",
                          errorText: signupStore.emailError,
                        );
                      }),
                      SizedBox(height: 16),
                      FieldTitle(
                        title: "Celular",
                        subtitle: "Proteja sua conta",
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !signupStore.loading,
                          onChanged: signupStore.setPhone,
                          hint: "(51) 999999999",
                          errorText: signupStore.phoneError,
                          textInputType: TextInputType.phone,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                        );
                      }),
                      SizedBox(height: 16),
                      FieldTitle(
                        title: "Senha",
                        subtitle: "Use letras, números e caracteres especiais",
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !signupStore.loading,
                          obscure: true,
                          onChanged: signupStore.setPass1,
                          errorText: signupStore.pass1Error,
                        );
                      }),
                      SizedBox(height: 16),
                      FieldTitle(
                        title: "Confirmar Senha",
                        subtitle: "Repita a senha",
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          enabled: !signupStore.loading,
                          onChanged: signupStore.setPass2,
                          errorText: signupStore.pass2Error,
                          obscure: true,
                        );
                      }),
                      SizedBox(height: 16),
                      Observer(builder: (_) {
                        return RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: signupStore.loading
                                ? CircularProgressIndicator()
                                : Text(
                                    'CADASTRAR',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                            color: Colors.green,
                            disabledColor:
                                Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed:  signupStore.signUpPressed );
                      }),
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Já tem uma conta?  ",
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                                onTap: Navigator.of(context).pop,
                                child: Text(
                                  "Entrar!",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.purple,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
