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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TabBarMenu(),
    );
  }

}

class TabBarMenu extends StatelessWidget {
  const TabBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Finance'), centerTitle: true,
          foregroundColor: Colors.blue,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Home Page",
              ),
              Tab(
                text: "Income",
              ),
              Tab(
                text: "Expenses",
              ),
              Tab(
                text: "Savings",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: HomePage(),
            ),
            Center(
              child: Income(),
            ),
            Center(
              child: Expense(),
            ),
            Center(
              child: Saving(),
            )
          ],
        ),
      ),
    );
  }
}

  /**
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
  }**/
