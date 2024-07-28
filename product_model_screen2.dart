class Product {
  int? id;
  String? title;
  double? price;
  String? thumbnail;

  Product({this.id, this.title, this.price,this.thumbnail});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}