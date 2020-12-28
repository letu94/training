import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_page.dart';
import 'package:login_trainning_cnv/screen/login_screen/login_screen_provider.dart';
import 'package:login_trainning_cnv/widget/login_form/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BasePage<LoginScreen, LoginProvider> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  LoginProvider initProverder() {
    return LoginProvider(this);
  }

  @override
  void initState() {
    super.initState();
    appBar = null;
  }

  @override
  Widget body() {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueGrey,
          ),
          Positioned(
            top: 200,
            right: 10,
            child: Container(
              height: 250,
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/faux1.jpg'),
                // color: Colors.redAccent,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Container(
              height: 250,
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/leaf.jpg'),
                // color: Colors.redAccent,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 5,
            child: Container(
              height: 250,
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/rose.jpg'),
                // color: Colors.redAccent,
              ),
            ),
          ),
          Center(child: LoginForm()),
          Positioned(
            left: 150,
            bottom: 20,
            child: GestureDetector(
              child: Text(
                'CREATE AN ACCOUNT',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                print('a');
              },
            ),
          ),
        ],
      ),
    );
  }
}
