import 'dart:convert';
import 'dart:typed_data';

import 'package:mobile_final_project/features/home/data/models/product.dart';

class Restaurant {
  int? storeId;
  String? name;
  String? type;
  double? rating;
  double? latitude;
  double? longitude;
  String? address;
  String? description;
  Uint8List? imageData;
  List<Products>? products;

  Restaurant({
    this.storeId,
    this.name,
    this.type,
    this.rating,
    this.latitude,
    this.longitude,
    this.address,
    this.description,
    this.imageData,
    this.products,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
    name = json['name'];
    type = json['type'];
    rating = json['rating']?.toDouble();
    latitude = json['latitude']?.toDouble();
    longitude = json['longitude']?.toDouble();
    address = json['address'];
    description = json['description'];
    if (json['imageData'] != null) {
      imageData = base64Decode(json['imageData']['imageData']);
    }

    if (json['products'] != null) {
      products =
          (json['products'] as List)
              .map((productJson) => Products.fromJson(productJson))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['storeId'] = storeId;
    data['name'] = name;
    data['type'] = type;
    data['rating'] = rating;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['description'] = description;
    if (imageData != null) {
      data['imageData'] = imageData;
    }

    if (products != null) {
      data['products'] = products!.map((p) => p.toJson()).toList();
    }
    return data;
  }
}
