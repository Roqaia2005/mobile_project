import 'package:dio/dio.dart';
import 'package:mobile_final_project/features/home/data/models/restaurant.dart';

class RestaurantService {
  Dio dio;
  RestaurantService(this.dio);
  final String baseUrl = "http://192.168.1.19:8080";

  Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await dio.get("$baseUrl/getStores");

      if (response.statusCode == 200) {
        List<Restaurant> restaurants =
            response.data
                .map<Restaurant>((json) => Restaurant.fromJson(json))
                .toList();

        return restaurants;
      } else {
        throw Exception("Failed to load restaurants");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Restaurant>> getRestaurantsByProductId(int id) async {
    try {
      final response = await dio.get("$baseUrl/$id/getProductStores");

      if (response.statusCode == 200) {
        List<Restaurant> restaurants =
            response.data
                .map<Restaurant>((json) => Restaurant.fromJson(json))
                .toList();

        return restaurants;
      } else {
        throw Exception("Failed to load restaurants");
      }
    } catch (e) {
      rethrow;
    }
  }
}
