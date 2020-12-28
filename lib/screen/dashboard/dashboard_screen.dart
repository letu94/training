import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_page.dart';
import 'package:login_trainning_cnv/screen/dashboard/dashboard_provider.dart';
import 'package:login_trainning_cnv/widget/header_image/header_image_widget.dart';
import 'package:login_trainning_cnv/widget/hot_deals/hot_deals_widget.dart';
import 'package:login_trainning_cnv/widget/product_seen/product_seen_widget.dart';
import 'package:login_trainning_cnv/widget/serch_trending/search_trending_widget.dart';

class DashBoadScreen extends StatefulWidget {
  @override
  _DashBoadScreenState createState() => _DashBoadScreenState();
}

class _DashBoadScreenState
    extends BasePage<DashBoadScreen, DashBoadScreenProvider> {
  @override
  Widget body() {
    return Scaffold(
        body: SafeArea(
          child: _buildMainView(context),
        ));
  }

  @override
  DashBoadScreenProvider initProverder() {
    return DashBoadScreenProvider(this);
  }

  @override
  void initState() {
    super.initState();
    appBar = null;
  }

  Widget _buildMainView(BuildContext context) {
    return Center(
        child: Container(
         
          child: ListView(
            children: [
              HeaderImage(),
              HotDealsProduct(expiredDate: provider.expiredDate),
              SeenProduct(),
              SearchTrending(),
              FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    provider.logOut(context);
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(fontSize: 16, fontFamily: 'Bold'),
                  ))
            ],
          ),
        ),
    );
  }
}
