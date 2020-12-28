import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_view.dart';
import 'package:login_trainning_cnv/widget/login_form/login_form_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  LoginForm();
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends BaseView<LoginForm, LoginFormProvider> {
  TextEditingController userNameController;
  TextEditingController passwordController;
  SharedPreferences localStorage;
  bool loadding;
  String hintUsername;
  String hintPassword;

  @override
  LoginFormProvider initProverder() {
    return LoginFormProvider(this);
  }

  @override
  void initState() {
    super.initState();
    loadding = false;
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    hintUsername = 'User name';
    hintPassword = 'Password';
    provider.autoLogin();
  }

  @override
  Widget body() {
    return Container(
      width: 250,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.green[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'Welcome to Gardenex',
              style: TextStyle(
                  fontFamily: 'Bold', fontSize: 18, color: Colors.white),
            ),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                  hintText: hintUsername,
                  hintStyle: TextStyle(
                    fontFamily: 'Regular',
                    color:
                        hintUsername == 'User name' ? Colors.white : Colors.red,
                  )),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: hintPassword,
                  hintStyle: TextStyle(
                    fontFamily: 'Regular',
                    color:
                        hintPassword == 'Password' ? Colors.white : Colors.red,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: FlatButton(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(fontFamily: "Mali-Bold"),
                  ),
                  onPressed: () async {
                    bool validateLogin = provider.validateLogin(userNameController.text, passwordController.text);
                    if (validateLogin) {
                      await provider.login(userNameController.text.toString(),
                          passwordController.text.toString());
                    }
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Text(
                'Forgot your password?',
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
