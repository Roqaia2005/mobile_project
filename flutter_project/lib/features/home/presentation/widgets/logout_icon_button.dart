import 'package:flutter/material.dart';
import 'package:mobile_final_project/features/auth/presentation/views/login_view.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          ),
      icon: Icon(Icons.logout, color: Colors.white),
    );
  }
}
