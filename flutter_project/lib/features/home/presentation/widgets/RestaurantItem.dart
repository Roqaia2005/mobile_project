// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_final_project/features/home/presentation/views/restaurant_products_view.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
    required this.name,
    required this.address,
    required this.imageData,
  });

  final String name;
  final String address;
  final Uint8List imageData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // borderOnForeground: true,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFFF9F9FB),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     color: const Color(0xff576CD6),
            //     shape: BoxShape.circle,
            //   ),
            //   padding: const EdgeInsets.all(12),
            //   child: const Icon(Icons.restaurant_menu, color: Colors.white),
            // ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                // border: Border.all(color: const Color(0xff576CD6), width: 2),
                image: DecorationImage(
                  image: MemoryImage(imageData),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2B3C60),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
