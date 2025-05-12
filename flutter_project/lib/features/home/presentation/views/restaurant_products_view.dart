// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mobile_final_project/core/colors.dart';
import 'package:mobile_final_project/core/widgets/back_arrow_icon_button.dart';
import 'package:mobile_final_project/core/widgets/custom_app_bar.dart';
import 'package:mobile_final_project/core/widgets/grid_view_products.dart';
import 'package:mobile_final_project/features/home/data/models/restaurant.dart';

class RestaurantProducts extends StatelessWidget {
  const RestaurantProducts({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(
        leading: const BackArrowIconButton(),
        title: restaurant.name!,
        isSearch: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.memory(
                restaurant.imageData!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              restaurant.name!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(
                  restaurant.rating.toString(),
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              restaurant.address!,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              restaurant.description!,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),

            const Text(
              "Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            GridViewProducts(products: restaurant.products!),
          ],
        ),
      ),
    );
  }
}
