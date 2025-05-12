import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_final_project/features/home/data/models/restaurant.dart';
import 'package:mobile_final_project/features/home/data/services/restaurant_service.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit({required this.restaurantService})
    : super(RestaurantInitial()) {
    fetchRestaurants();
  }

  final RestaurantService restaurantService;

  Future<void> fetchRestaurants() async {
    emit(RestaurantLoading());
    try {
      final response = await restaurantService.getRestaurants();
      emit(RestaurantSuccess(response));
    } catch (e) {
      emit(RestaurantFailure(e.toString()));
    }
  }
}
