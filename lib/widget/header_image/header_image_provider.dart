import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_notifier.dart';
import 'package:login_trainning_cnv/base/base_provider.dart';
import 'package:login_trainning_cnv/model/Product.dart';
import 'package:login_trainning_cnv/model/get_data.dart';
import 'package:login_trainning_cnv/widget/header_image/header_image_widget.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HeaderImageProvider extends BaseProvider<HeaderImageState> {
  HeaderImageProvider(HeaderImageState state) : super(state) {
    // init();
    countDownTimerHeader();
  }
  PageController controllerPageView = PageController(initialPage: 0);
  SharedPreferences localStorage;
  HeaderImageNotifier headerImageNotifier = new HeaderImageNotifier([]);
  int _currentPage = 0;
  Timer timer;

  @override
  List<BaseNotifier> initNotifiers() {
    return [headerImageNotifier];
  }

  getHeaderImageAPI() async {
    showLoading();
    var url = 'https://gardenex.herokuapp.com/plant/';
    localStorage = await SharedPreferences.getInstance();
    var response = await http.get(url, headers: {
      'Authorization': "Bearer " + localStorage.getString('token'),
    });
    hiddenLoading();
    Map<String, dynamic> data = json.decode(response.body);
    List<Product> dataJson = GetData.fromJson(data).data;
    headerImageNotifier.value =
        dataJson.sublist(dataJson.length - 6, dataJson.length - 1);
  }

  countDownTimerHeader() {
    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (!state.mounted) timer.cancel();
      if (_currentPage < headerImageNotifier.value.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (state.mounted)
        controllerPageView.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),

          /// hieu ung chuyen man hinh, cang nho se ko thay hieu ung chuyen
          curve: Curves.easeIn,
        );
    });
  }
}

class HeaderImageNotifier extends BaseNotifier<List<Product>> {
  HeaderImageNotifier(List<Product> value) : super(value);

  @override
  SingleChildWidget provider() {
    return ChangeNotifierProvider<HeaderImageNotifier>(create: (_) => this);
  }
}
