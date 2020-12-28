class ItemProduct {
  String image;
  String deal;
  double price;

  ItemProduct.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    deal = json['deal'];
    price = json['price'];
  }
}
