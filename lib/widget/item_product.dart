import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/model/Product.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final String baseUrl = 'https://res.cloudinary.com/dziablq1m/image/upload/';

  ItemProduct(this.product);
  @override
  Widget build(BuildContext context) {
    String image =
        product.urlImage != null ? product.urlImage[0].image.first : '';
    String price = product.size != null ? product.size[0].price : '';
    // String deal = product.deal != null  ? product.deal : '';

    return Container(
      decoration: BoxDecoration(
        // color: Colors.orange,
      ),
      width: MediaQuery.of(context).size.width / 3.5,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, right: 5),
                child: ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: image != null
                      ? FadeInImage.assetNetwork(
                        fadeInCurve: Curves.bounceIn,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          placeholder: 'assets/images/loading.png',
                          image: baseUrl + image)
                      : SizedBox(),
                
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '13%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
              // Positioned(top: 0, right: 5, child: Text(deal)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            price,
            style: TextStyle(color: Colors.white, fontFamily: 'Regular'),
          ),
        ],
      ),
    );
  }
}
