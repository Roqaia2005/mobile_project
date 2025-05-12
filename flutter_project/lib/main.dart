import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/features/home/view_model/cubits/restaurant_cubit/restaurant_cubit.dart';
import 'package:mobile_final_project/features/home/data/services/restaurant_service.dart';
import 'package:mobile_final_project/features/auth/presentation/views/home_view.dart';
import 'package:mobile_final_project/features/auth/view_model/cubits/login_cubit/login_cubit.dart';
import 'package:mobile_final_project/features/search/presentation/views/search_view.dart';
import 'package:mobile_final_project/features/search/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:mobile_final_project/features/auth/view_model/cubits/signup_cubit/signup_cubit.dart';
import 'package:mobile_final_project/features/search/presentation/widgets/noResultBody.dart';
import 'package:mobile_final_project/features/home/presentation/views/restuarant_view.dart';
import 'package:mobile_final_project/features/search/presentation/widgets/searchingBody.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<SignupCubit>(create: (context) => SignupCubit()),
        BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
        BlocProvider<RestaurantCubit>(
          create:
              (context) =>
                  RestaurantCubit(restaurantService: RestaurantService(Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RestaurantView(),
      ),
    );
  }
}
