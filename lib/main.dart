import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_do_an_2_1/HomePage/bloc/home_bloc.dart';
import 'package:shop_do_an_2_1/HomePage/ui/HomePage.dart';
import 'package:shop_do_an_2_1/Login/ui/LoginPage.dart';
import 'package:shop_do_an_2_1/OrderDetailPage/bloc/order_detail_bloc.dart';
import 'package:shop_do_an_2_1/OrderDetailPage/ui/OrderDetailPage.dart';

import 'Login/bloc/login_bloc.dart';
import 'SimpleBlocObserver .dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = const SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {g
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
          BlocProvider<OrderDetailBloc>(
          create: (context) => OrderDetailBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            LoginPage.routeName: (context) => const LoginPage(),
            HomePage.routeName: (context) => const HomePage(),
            OrderDetailPage.routeName: (context) => const OrderDetailPage(),
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.blue),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const LoginPage()),
    );
  }
}
