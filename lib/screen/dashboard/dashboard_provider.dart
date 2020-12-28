

import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_notifier.dart';
import 'package:login_trainning_cnv/base/base_provider.dart';
import 'package:login_trainning_cnv/screen/login_screen/login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DashBoadScreenProvider extends BaseProvider {
  DashBoadScreenProvider(State<StatefulWidget> state) : super(state) {
    expiredDate = DateTime(now.year, now.month, now.day, 16, 52, 0);
  }

  PageController controllerPageView = PageController(initialPage: 0);

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime get now => DateTime.now();
  DateTime expiredDate;

  // SharedPreferences localStorage;



  @override
  List<BaseNotifier> initNotifiers() {
    return [];
  }


  

  logOut(BuildContext context) {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Ban co muon dang xuat khong?'),
        content: Text(
          'Neu dang xuat ban se phai nhap mat khau vao lan dang nhap sau',
          style: TextStyle(fontFamily: 'Regular', fontSize: 18),
        ),
        actions: <Widget>[
          FlatButton(
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: TextStyle(fontFamily: 'Bold', fontSize: 20),
            ),
          ),
          SizedBox(width: 20),
          FlatButton(
            color: Colors.green,
            onPressed: () async {
              SharedPreferences localStorage = await SharedPreferences.getInstance();
              localStorage.getString('token');
              await localStorage.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text(
              'Yes',
              style: TextStyle(fontFamily: 'Bold', fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
