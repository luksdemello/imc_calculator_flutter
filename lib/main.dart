import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/change_notifier/change_notifier_page.dart';
import 'package:imc_calculator/pages/home/home_page.dart';
import 'package:imc_calculator/pages/set_state/set_state_page.dart';
import 'package:imc_calculator/pages/value_notifier/value_notifier_page.dart';

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
        '/set_state': (context) => const SetStatePage(),
        '/value_notifier': (context) => const ValueNotifierPage(),
        '/change_notifier': (context) => const ChangeNotifierPage(),
      },
    );
  }
}
