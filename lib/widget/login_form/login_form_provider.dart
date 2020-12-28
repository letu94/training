import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_notifier.dart';
import 'package:login_trainning_cnv/base/base_provider.dart';
import 'package:login_trainning_cnv/model/login_respone.dart';
import 'package:login_trainning_cnv/screen/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'login_form_widget.dart';

class LoginFormProvider extends BaseProvider<LoginFormState> {
  LoginFormProvider(LoginFormState state) : super(state);

  SharedPreferences localStorage;

  @override
  List<BaseNotifier> initNotifiers() {
    return [];
  }

  login(String username, String password) async {
    var url = 'https://gardenex.herokuapp.com/user/authenticate';
    showLoading();

    var response = await http.post(url, headers: {
      // 'content-type': 'application/json',
      'accept': 'application/json',
    }, body: {
      'username': username,
      'password': password
    });
    hiddenLoading();

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> body = json.decode(response.body);
    LoginRespone loginRespone = LoginRespone.fromJson(body);
    if (loginRespone.success) {
      await saveStorage(DataRespone.fromJson(loginRespone.data).token);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashBoadScreen()),
      );
      print('Login successs');
    } else {
      showInSnackBar("sai mat khau");
    }
  }

  saveStorage(String token) async {
    localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', token);
  }

  autoLogin() async {
    localStorage = await SharedPreferences.getInstance();
    String token = localStorage.getString('token');
    if (token != null) {
      if (token.isNotEmpty) {
        Navigator.pushNamed(context, 'dashBoard');
      }
      // _login(token.toString());
    }
  }

  void showInSnackBar(String value) {
    showSnackBar(value);
  }

  bool validateLogin(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      showInSnackBar('Vui long nhap day du User name, Password');
      return false;
    } else
      return true;
  }
}
