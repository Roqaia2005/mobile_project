class User {
  final int customerId;
  final String email;
  final String? gender;
  final String latitude;
  final String longitude;
  final String level;
  final String name;
  final String password;

  User({
    required this.customerId,
    required this.email,
    this.gender,
    required this.latitude,
    required this.longitude,
    required this.level,
    required this.name,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      customerId: json['customerId'] ?? 0,
      email: json['email'] ?? '',
      gender: json['gender'],
      latitude: json['latitude'] ?? '0',
      longitude: json['longitude'] ?? '0',
      level: json['level'] ?? '0',
      name: json['name'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'email': email,
      'gender': gender,
      'latitude': latitude,
      'longitude': longitude,
      'level': level,
      'name': name,
      'password': password,
    };
  }
}