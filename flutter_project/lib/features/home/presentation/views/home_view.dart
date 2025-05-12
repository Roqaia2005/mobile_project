import 'package:flutter/material.dart';
import 'package:mobile_final_project/core/colors.dart';
import 'package:mobile_final_project/core/widgets/customButton.dart';
import 'package:mobile_final_project/features/auth/presentation/views/login_view.dart';
import 'package:mobile_final_project/features/auth/presentation/views/signup_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),

        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image(image: AssetImage("assets/images/shopping.gif")),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 20, top: 50),
                  child: Text(
                    "Welcome to DineFind! Register now to discover nearby restaurants and products tailored to your taste. Easily search, explore, and see the distance to each location your perfect dining experience starts here!",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "MarckScript-Regular",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50),

                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },

                  text: "Register Now",
                ),
                SizedBox(height: 20),

                Text(
                  "Already here?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'MarckScript-Regular',
                  ),
                ),
                SizedBox(height: 20),

                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },

                  text: "      Login        ",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
