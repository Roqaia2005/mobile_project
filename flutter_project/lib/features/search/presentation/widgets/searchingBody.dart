import 'package:flutter/material.dart';
import 'package:mobile_final_project/core/utils/assets_data.dart';

class SearchingBody extends StatelessWidget {
  const SearchingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff576CD6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Image(image: AssetImage(AssetsData().searching))],
          ),
        ),
      ),
    );
  }
}
