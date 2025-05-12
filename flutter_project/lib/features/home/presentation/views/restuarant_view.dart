// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_final_project/features/home/view_model/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:mobile_final_project/features/home/data/models/restaurant.dart';
import 'package:mobile_final_project/features/auth/presentation/views/login_view.dart';
import 'package:mobile_final_project/features/home/presentation/views/restaurant_products_view.dart';
import 'package:mobile_final_project/features/search/presentation/views/search_view.dart';
import 'package:mobile_final_project/features/home/presentation/widgets/RestaurantItem.dart';
import 'package:mobile_final_project/core/widgets/custom_app_bar.dart';
import 'package:mobile_final_project/features/home/presentation/widgets/logout_icon_button.dart';

class RestaurantView extends StatelessWidget {
  RestaurantView({super.key});
  List<Restaurant> allRestaurants = []; //just for test
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B3C60),
      appBar: CustomAppBar(
        leading: LogoutIconButton(),
        title: "All restaurants",
      ),
      body: BlocConsumer<RestaurantCubit, RestaurantState>(
        listener: (context, state) {
          if (state is RestaurantSuccess) {
            allRestaurants = state.restaurants;
          }
        },
        builder: (context, state) {
          if (state is RestaurantLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RestaurantFailure) {
            return Center(
              child: Text(state.error, style: TextStyle(color: Colors.white)),
            );
          } else if (allRestaurants.isEmpty) {
            return Center(
              child: Text(
                "No restaurants found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: allRestaurants.length,
              //length of retrieved restaurants from api
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => RestaurantProducts(
                                restaurant: allRestaurants[index],
                              ),
                        ),
                      );
                    },
                    child: RestaurantItem(
                      name: allRestaurants[index].name!,
                      address: allRestaurants[index].address!,
                      imageData: allRestaurants[index].imageData!,
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
