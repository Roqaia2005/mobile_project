import 'package:flutter/material.dart';

class SearchingBody extends StatelessWidget {
  const SearchingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff576CD6),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Image(image: AssetImage("assets/images/searching/gif"))],
          ),
        ),
      ),
    );
  }
}
