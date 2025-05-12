import 'dart:convert';
import 'dart:typed_data';

class Products {
  int? productId;
  String? name;
  double? price;
  int? amount;
  String? description;
  Uint8List? imageData;

  Products({
    this.productId,
    this.name,
    this.price,
    this.amount,
    this.description,
    this.imageData,
  });

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    price = json['price']?.toDouble();
    amount = json['amount'];
    description = json['description'];
    if (json['imageData'] != null) {
      imageData = base64Decode(json['imageData']['imageData']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['price'] = price;
    data['amount'] = amount;
    data['description'] = description;
    if (imageData != null) {
      data['imageData'] = imageData;
    }
    return data;
  }
}
