import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:mobile_final_project/features/auth/data/models/user.dart';

class AuthService {
  static const String baseUrl = 'http://localhost:8081/api/customers';
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ))..httpClientAdapter = IOHttpClientAdapter()
    ..onHttpClientCreate = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

  Future<User> signup({
    required String name,
    required String email,
    required String password,
    String? gender = '',
    double latitude = 0.0,
    double longitude = 0.0,
    int level = 1,
  }) async {
    try {
      final response = await _dio.post(
        '/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'gender': gender,
          'latitude': latitude,
          'longitude': longitude,
          'level': level,
        },
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else if (response.statusCode == 400) {
        throw Exception('Email already exists: ${response.data}');
      } else {
        throw Exception('Failed to signup: ${response.statusCode} - ${response.data}');
      }
    } catch (e) {
      print('Error during signup: $e');
      if (e is DioException) {
        throw Exception('Signup failed: ${e.response?.data ?? e.message}');
      }
      rethrow;
    }
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password: ${response.data}');
      } else {
        throw Exception('Failed to login: ${response.statusCode} - ${response.data}');
      }
    } catch (e) {
      print('Error during login: $e');
      if (e is DioException) {
        throw Exception('Login failed: ${e.response?.data ?? e.message}');
      }
      rethrow;
    }
  }
}

extension on Dio {
  set onHttpClientCreate(Function(dynamic client) onHttpClientCreate) {}
}