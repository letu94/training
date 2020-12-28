import 'package:login_trainning_cnv/model/Product.dart';

class GetData {
  List<Product> data;
  GetData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? List.from(json['data'].map((data) => Product.fromJson(data)))
        : [];
  }
}

/// sai
// class Color {
//   List<String> iamge;
//   String code;

//   Color.fromJson(Map<String, dynamic> json) {
//     iamge = json['image']  != null ? List.from(json['image'].map((image) => image)) : [];
//     code = json['code'];
//   }
// }

/// sai
// class Size {
//   String code;
//   String name;
//   String price;

//   Size.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     name = json['name'];
//     price = json['price'];
//   }
// }
