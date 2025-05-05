import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mobile_final_project/views/login_view.dart';
import 'package:mobile_final_project/views/signup_view.dart';
import 'package:mobile_final_project/widgets/customButton.dart';

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
            colors: [Color(0xff576CD6), Color(0xff2B3C60)],
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

                  child: Column(
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            colors: [
                              Colors.white,

                              Color(0xff527DBC),

                              Color(0xff2B3C60),
                            ],
                            "Welcome to DineFind!",
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "MarckScript-Regular",
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        repeatForever: true,
                      ),
                      Text(
                        "Register now to discover nearby restaurants and products tailored to your taste. Easily search, explore, and see the distance to each location your perfect dining experience starts here!",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "MarckScript-Regular",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
