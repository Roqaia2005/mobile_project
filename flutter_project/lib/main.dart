import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/features/auth/presentation/views/home_view.dart';
import 'package:mobile_final_project/features/auth/presentation/views/login_view.dart';
import 'package:mobile_final_project/features/auth/presentation/views/signup_view.dart';
import 'package:mobile_final_project/features/home/data/services/restaurant_service.dart';
import 'package:mobile_final_project/features/auth/view_model/cubits/login_cubit/login_cubit.dart';
import 'package:mobile_final_project/features/auth/view_model/cubits/signup_cubit/signup_cubit.dart';
import 'package:mobile_final_project/features/home/presentation/views/restuarant_view.dart';
import 'package:mobile_final_project/features/home/view_model/cubits/product_cubit/product_cubit.dart';
import 'package:mobile_final_project/features/search/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:mobile_final_project/features/home/view_model/cubits/restaurant_cubit/restaurant_cubit.dart';

import 'features/auth/services/auth_service.dart';
// main.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit(authService)),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(authService),
        ),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
        BlocProvider<RestaurantCubit>(
          create:
              (context) =>
                  RestaurantCubit(restaurantService: RestaurantService(Dio())),
        ),
        BlocProvider<ProductCubit>(
          create:
              (context) =>
                  ProductCubit(restaurantService: RestaurantService(Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/signup': (context) => SignUpView(),
          '/login': (context) => LoginView(),
          '/home': (context) => HomeView(),
          '/store': (context) => RestaurantView(),
        },
      ),
    );
  }
}
