import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_view.dart';
import 'package:login_trainning_cnv/model/Product.dart';
import 'package:login_trainning_cnv/widget/count_down_timer_widget/count_down_timer_widget.dart';
import 'package:login_trainning_cnv/widget/hot_deals/hot_deals_provider.dart';
import 'package:login_trainning_cnv/widget/item_product.dart';
import 'package:provider/provider.dart';

import 'hot_deals_provider.dart';

class HotDealsProduct extends StatefulWidget {
  final DateTime expiredDate;
   final List<Product> data;


  const HotDealsProduct({Key key, this.expiredDate, this.data}) : super(key: key);
  @override
  HotDealsProductState createState() => HotDealsProductState();
}

class HotDealsProductState extends BaseView<HotDealsProduct, HotDealsProvider> {

 @override
  HotDealsProvider initProverder() {
    return HotDealsProvider(this);
  }
  @override
  void initState() {
    super.initState();
    provider.getHotDealsAPI();
  }

  @override
  Widget body() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.green,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Gardeal',
                      style: TextStyle(
                          fontFamily: 'Bold',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                CountDownTimerWidget(expiredDate: widget.expiredDate),
                ],
              ),
              
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                
                child: Consumer<HotDealsProductNotifier> (builder: (context, listHotDeals, _){
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listHotDeals.value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ItemProduct(listHotDeals.value[index]),
                        ),
                      );
                    });
                },) 
              ),
              Column(
                children: [
                  Text(
                    'Xem them',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Regular'),
                  ),
                  Text(
                    '^^',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Regular'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}




