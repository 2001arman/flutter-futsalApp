import 'package:demo_futsalapp/cubit/auth_cubit.dart';
import 'package:demo_futsalapp/cubit/field_cubit.dart';
import 'package:demo_futsalapp/cubit/lapangan_cubit.dart';
import 'package:demo_futsalapp/cubit/page_cubit.dart';
import 'package:demo_futsalapp/cubit/transaksi_cubit.dart';
import 'package:demo_futsalapp/pages/login_page.dart';
import 'package:demo_futsalapp/pages/main_page.dart';
import 'package:demo_futsalapp/pages/register_page.dart';
import 'package:demo_futsalapp/pages/splash_screen.dart';
import 'package:demo_futsalapp/pages/success_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => FieldCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LapanganCubit(),
        ),
        BlocProvider(
          create: (context) => TransaksiCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          'register-page': (context) => RegisterPage(),
          'login-page': (context) => LoginPage(),
          'main-page': (context) => MainPage(),
          'success-page': (context) => SuccessPage(),
        },
        // home: HomePage(),
      ),
    );
  }
}
