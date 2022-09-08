import 'package:currencyapp/routes/currency_routes.dart';
import 'package:currencyapp/screens/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: MaterialApp(
        title: 'Currency App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: CurrencyRoutes.instance.onGenerateRoute,
        initialRoute: "/home",
      ),
    );
  }
}
