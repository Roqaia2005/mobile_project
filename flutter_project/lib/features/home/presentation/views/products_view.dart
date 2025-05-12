// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/core/colors.dart';
import 'package:mobile_final_project/core/widgets/back_arrow_icon_button.dart';
import 'package:mobile_final_project/core/widgets/custom_app_bar.dart';
import 'package:mobile_final_project/core/widgets/grid_view_products.dart';
import 'package:mobile_final_project/core/widgets/grid_view_restaurants.dart';
import 'package:mobile_final_project/features/home/data/models/product.dart';
import 'package:mobile_final_project/features/home/view_model/cubits/product_cubit/product_cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(
        leading: const BackArrowIconButton(),
        title: product.name!,
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
                product.imageData!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              product.description!,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),

            const Text(
              "Restaurants",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),

            GridViewRestaurants(),
          ],
        ),
      ),
    );
  }
}
