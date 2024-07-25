import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/expense.dart';
import 'package:personal_finance/widgets/home_page.dart';
import 'package:personal_finance/widgets/income.dart';
import 'package:personal_finance/widgets/savings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) =>  const HomePage(),
        '/income': (context) =>  const Income(),
        '/expenses': (context) => const Expense(),
        '/savings': (context) => const Saving(),
      },
    );
  }
}
