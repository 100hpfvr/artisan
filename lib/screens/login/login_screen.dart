//import 'dart:html';

import 'package:artisan/components/customtextfield/custom_icon_button.dart';
import 'package:artisan/components/customtextfield/custom_text_field.dart';
import 'package:artisan/helpers/error_popup.dart';
import 'package:artisan/screens/signup/signup_screen.dart';
import 'package:artisan/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(32),
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Observer(builder: (_) {
                        return loginStore.error != null ? showDialog(context: context, builder:  (BuildContext context) {
                          return ErrorPopup(message: loginStore.error,);
                        },) : Container();
                      }),
                      RaisedButton(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                        child: Text('Entrar com Facebook'),
                        textColor: Colors.white,
                        onPressed: () {},
                        //                  onPressed: loginStore.loginPressed,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          hint: 'E-mail',
                          prefix: Icon(Icons.account_circle),
                          textInputType: TextInputType.emailAddress,
                          errorText: loginStore.emailError,
                          onChanged: loginStore.setEmail,
                          //enabled: (){},
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return CustomTextField(
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          errorText: loginStore.passwordError,
                          obscure: !loginStore.passwordVisible,
                          onChanged: loginStore.setPassword,
                          maxLines: 1,
                          // enabled: !loginStore.loading,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: loginStore.passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onTap: loginStore.TogglePasswordVisibility,
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      Observer(
                        builder: (_) {
                          return SizedBox(
                            height: 44,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('Login'),
                              color: Theme.of(context).primaryColor,
                              disabledColor:
                                  Theme.of(context).primaryColor.withAlpha(100),
                              textColor: Colors.white,
                              onPressed: loginStore.loginPressed,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.black87,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Não tem uma conta? ",
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => SignUpScreen()));
                                },
                                child: Text(
                                  "Clique aqui!",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.purple,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
    );
  }
}

//loginStore.loading
//                               ? CircularProgressIndicator(
//                               valueColor:
//                               AlwaysStoppedAnimation(Colors.white))
//                               :
