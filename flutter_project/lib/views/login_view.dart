import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/helper.dart';
import 'package:mobile_final_project/views/home_view.dart';
import 'package:mobile_final_project/cubit/login_cubit.dart';
import 'package:mobile_final_project/views/signup_view.dart';
import 'package:mobile_final_project/widgets/customButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mobile_final_project/widgets/customTextFormField.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;

          showSnackBar(context, "Successfully logged in");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        } else {
          showSnackBar(context, "something went wrong");
        }
      },
      builder:
          (context, state) => ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: Color(0xff576CD6),
              body: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/donut.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(500),
                          bottomRight: Radius.circular(500),
                        ),
                      ),
                      height: 230,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 25),

                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Welcome back",
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontFamily: 'MarckScript-Regular',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Center(
                      child: Text(
                        "Login to your account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    CustomTextFormField(
                      icon: Icons.email,
                      controller: emailController,
                      hintText: "Email",
                      isRequired: true,
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      icon: Icons.lock,
                      controller: passwordController,
                      isPassword: true,

                      hintText: "Password",
                      isRequired: true,
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).loginUser(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      text: "LOGIN",
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(color: Color(0xffD8DDF5)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpView(),
                              ),
                            );
                          },
                          child: const Text(
                            " REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
