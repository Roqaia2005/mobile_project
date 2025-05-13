// features/auth/data/models/user.dart
class User {
  final int customerId;
  final String email;
  final String name;
  final int level;
  final String gender;
  final String password;
  final double latitude;
  final double longitude;

  User({
    required this.customerId,
    required this.email,
    required this.name,
    required this.level,
    required this.gender,
    required this.password,
    required this.latitude,
    required this.longitude,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      customerId: json['customerId'] ?? 0,
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      level: json['level'] ?? 0,
      gender: json['gender'] ?? '',
      password: json['password'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }
}