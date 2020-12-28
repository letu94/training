
import 'dart:convert';

import 'package:login_trainning_cnv/base/base_notifier.dart';
import 'package:login_trainning_cnv/base/base_provider.dart';
import 'package:login_trainning_cnv/model/Product.dart';
import 'package:login_trainning_cnv/model/get_data.dart';
import 'package:login_trainning_cnv/widget/product_seen/product_seen_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SeenProductProvider extends BaseProvider<SeenProductState> {
  SeenProductProvider(SeenProductState state) : super(state);
SharedPreferences localStorage;

SeenProductNotifier seenProductNotifier = new SeenProductNotifier([]);
  @override
  List<BaseNotifier> initNotifiers() {
    return [seenProductNotifier];
  }
getSeenProductAPI() async {
    showLoading();
    var url = 'https://gardenex.herokuapp.com/plant/';
    localStorage = await SharedPreferences.getInstance();
    var response = await http.get(url, headers: {
      'Authorization': "Bearer " + localStorage.getString('token'),
    });
    hiddenLoading();
    Map<String, dynamic> data = json.decode(response.body);
    List<Product> dataJson = GetData.fromJson(data).data;
    seenProductNotifier.value = dataJson.sublist(dataJson.length ~/ 2, dataJson.length -1);
  }
}

class SeenProductNotifier extends BaseNotifier<List<Product>> {
  SeenProductNotifier(List<Product> value) : super(value);

  @override
  SingleChildWidget provider() {
    return ChangeNotifierProvider<SeenProductNotifier>(create: (_) => this);
  }
}