import 'dart:convert';

import 'package:login_trainning_cnv/base/base_notifier.dart';
import 'package:login_trainning_cnv/base/base_provider.dart';
import 'package:login_trainning_cnv/widget/hot_deals/hot_deals_widget.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/Product.dart';
import '../../model/get_data.dart';

class HotDealsProvider extends BaseProvider<HotDealsProductState> {
  HotDealsProvider(HotDealsProductState state) : super(state);
  
  HotDealsProductNotifier _hotDealNotifier = HotDealsProductNotifier([]);

SharedPreferences localStorage;

  @override
  List<BaseNotifier> initNotifiers() {
    return [_hotDealNotifier];
  }
getHotDealsAPI() async {
    showLoading();
    var url = 'https://gardenex.herokuapp.com/plant/';
    localStorage = await SharedPreferences.getInstance();
    var response = await http.get(url, headers: {
      'Authorization': "Bearer " + localStorage.getString('token'),
    });
    hiddenLoading();
    Map<String, dynamic> data = json.decode(response.body);
    List<Product> dataJson = GetData.fromJson(data).data;
    _hotDealNotifier.value = dataJson.sublist(0, dataJson.length ~/ 2);
  }
}

class HotDealsProductNotifier extends BaseNotifier<List<Product>> {
  HotDealsProductNotifier(List<Product> value) : super(value);

  @override
  SingleChildWidget provider() {
    return ChangeNotifierProvider<HotDealsProductNotifier>(create: (_) => this);
  }
}
