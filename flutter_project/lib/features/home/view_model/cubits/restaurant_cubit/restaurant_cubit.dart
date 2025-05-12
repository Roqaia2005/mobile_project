import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_final_project/features/home/data/models/product.dart';
import 'package:mobile_final_project/features/home/data/models/restaurant.dart';
import 'package:mobile_final_project/features/home/data/services/restaurant_service.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit({required this.restaurantService})
    : super(RestaurantInitial()) {
    fetchRestaurants();
  }

  final RestaurantService restaurantService;
  List<Restaurant> allRestaurants = [];
  final List<Product> filteredProducts = [];

  Future<void> fetchRestaurants() async {
    emit(RestaurantLoading());
    try {
      final response = await restaurantService.getRestaurants();
      allRestaurants = response;
      for (var restaurant in allRestaurants) {
        filteredProducts.addAll(restaurant.products!);
      }

      emit(RestaurantSuccess());
    } catch (e) {
      emit(RestaurantFailure(e.toString()));
    }
  }
}
