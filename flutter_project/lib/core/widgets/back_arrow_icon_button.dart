import 'package:flutter/material.dart';

class BackArrowIconButton extends StatelessWidget {
  const BackArrowIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back, color: Colors.white),
    );
  }
}
