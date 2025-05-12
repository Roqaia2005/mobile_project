import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/core/colors.dart';
import 'package:mobile_final_project/features/home/data/models/product.dart';
import 'package:mobile_final_project/features/home/presentation/views/products_view.dart';
import 'package:mobile_final_project/features/home/view_model/cubits/product_cubit/product_cubit.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.88,
      ),

      shrinkWrap: true,

      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () async {
            await BlocProvider.of<ProductCubit>(
              context,
            ).fetchRestaurantsByProductId(products[index].productId!);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsView(product: products[index]),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9FB),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    products[index].imageData!,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  products[index].name.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Amaranth-Regular',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    products[index].description.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Amaranth-Regular',
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '\$${products[index].price.toString()}',
                    style: const TextStyle(
                      fontFamily: 'Amaranth-Regular',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor, // Project primary blue
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
