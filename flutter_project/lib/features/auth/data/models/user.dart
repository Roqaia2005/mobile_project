import 'package:mobile_final_project/features/home/data/models/product.dart';

class User {
  final int customerId;
  final String email;
  final String name;
  final int level;
  final String gender;
  final String password;
  final double latitude;
  final double longitude;
  final List<Product> products;

  User({
    required this.customerId,
    required this.email,
    required this.name,
    required this.level,
    required this.gender,
    required this.password,
    required this.latitude,
    required this.longitude,
    required this.products,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      customerId: json['customerId'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      level: json['level'] as int,
      gender: json['gender'] as String? ?? '',
      password: json['password'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      products: (json['products'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}

