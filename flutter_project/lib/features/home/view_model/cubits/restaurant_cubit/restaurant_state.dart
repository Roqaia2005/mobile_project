part of 'restaurant_cubit.dart';

@immutable
sealed class RestaurantState {}

final class RestaurantInitial extends RestaurantState {}

final class RestaurantLoading extends RestaurantState {}

final class RestaurantSuccess extends RestaurantState {}

final class RestaurantFailure extends RestaurantState {
  final String error;

  RestaurantFailure(this.error);
}
