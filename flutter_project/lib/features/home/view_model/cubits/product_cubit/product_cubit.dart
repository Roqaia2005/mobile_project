// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:mobile_final_project/features/home/data/models/restaurant.dart';
import 'package:mobile_final_project/features/home/data/services/restaurant_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.restaurantService}) : super(ProductInitial());

  final RestaurantService restaurantService;
  List<Restaurant> allRestaurantsByProductId = [];

  Future<void> fetchRestaurantsByProductId(int id) async {
    emit(ProductLoading());
    try {
      final response = await restaurantService.getRestaurantsByProductId(id);
      allRestaurantsByProductId = response;
      emit(ProductSuccess());
    } catch (e) {
      emit(ProductFailure());
    }
  }
}
