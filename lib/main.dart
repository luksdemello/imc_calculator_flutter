import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/home/home_page.dart';
import 'package:imc_calculator/pages/set_state/set_state_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imc Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/set_state': (context) => SetStatePage()
      },
    );
  }
}
