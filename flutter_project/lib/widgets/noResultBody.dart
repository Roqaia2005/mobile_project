import 'package:flutter/material.dart';

class NoResultBody extends StatelessWidget {
  const NoResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff576CD6),

      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'No Result found for this product , try another one',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: "Amaranth-Regular",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
