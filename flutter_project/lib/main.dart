import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/views/home_view.dart';
import 'package:mobile_final_project/cubit/login_cubit.dart';
import 'package:mobile_final_project/views/search_view.dart';
import 'package:mobile_final_project/cubit/search_cubit.dart';
import 'package:mobile_final_project/cubit/signup_cubit.dart';
import 'package:mobile_final_project/widgets/noResultBody.dart';
import 'package:mobile_final_project/views/restuarant_view.dart';
import 'package:mobile_final_project/widgets/searchingBody.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
