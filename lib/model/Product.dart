
class Product {
  String id;
  String deal;
  List<String> price;
  String name;
  List<Color> urlImage;
  List<Size> size;
  Product(this.id, this.deal, this.price, this.urlImage, this.size, this.name);

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deal = json['deal'];
    price = json['price'];
    name = json['name'];
    size = json['size'] != null
        ? List.from(json['size'].map((e) => Size.fromJson(e)))
        : [];
    urlImage = json['color'] != null
        ? List.from(json['color'].map((e) => Color.fromJson(e)))
        : [];
  }
}

class Color {
  List<String> image;
  Color.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null
        ? List.from(json['image'].map((e) => e.toString()))
        : [];
  }
}

class Size {
  String price;
  Size.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }
}
