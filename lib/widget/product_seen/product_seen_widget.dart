 import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/base/base_view.dart';
import 'package:login_trainning_cnv/widget/item_product.dart';
import 'package:login_trainning_cnv/widget/product_seen/product_seen_provider.dart';
import 'package:provider/provider.dart';


class SeenProduct extends StatefulWidget {
  @override
  SeenProductState createState() => SeenProductState();
}

class SeenProductState extends BaseView<SeenProduct, SeenProductProvider> {
  @override
  
  @override
  void initState() {
    super.initState();
    provider.getSeenProductAPI();
  }

  @override
  Widget body() {
    return Column(
      children: [
        SizedBox(
          height: 20,
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
                      'San pham da xem',
                      style: TextStyle(fontFamily: 'Bold', fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'xem them>>',
                      style: TextStyle(fontFamily: 'Bold', fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 410,
                  child: Consumer<SeenProductNotifier>(builder: (context, seenProduct, _){
                    return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            ItemProduct(seenProduct.value[index * 2]),
                            (index * 2 + 1 >= seenProduct.value.length)
                                ? SizedBox()
                                : ItemProduct(seenProduct.value[index * 2 + 1])
                            // ItemProduct(data[index * 2 + 1]),
                          ],
                        ),
                      );
                    },
                    itemCount: (seenProduct.value.length + 1) ~/ 2,
                    scrollDirection: Axis.horizontal,
                  );
                  })
                  

                  // GridView.builder(
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 5,
                  //       mainAxisSpacing: 5,
                  //       childAspectRatio: 1.5),
                  //   itemBuilder: (context, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(child: ItemProduct(data[index])),
                  //     );
                  //   },
                  //   itemCount: data.length,
                  //   scrollDirection: Axis.horizontal,
                  // ),

                  )
            ],
          ),
        ),
      ],
    );
  }

  @override
  SeenProductProvider initProverder() {
    return SeenProductProvider(this);
  }
}
