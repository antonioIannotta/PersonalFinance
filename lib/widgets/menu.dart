import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/home_page.dart';
import 'package:personal_finance/widgets/income.dart';
import 'package:personal_finance/widgets/expense.dart';
import 'package:personal_finance/widgets/savings.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: PrimaryContainer(
          radius: 30,
          child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.blue,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.lightBlue,
              ),
              tabs: const [
                Tab(
                  text: 'Home Page',
                ),
                Tab(
                  text: 'Income',
                ),
                Tab(
                  text: 'Expenses',
                ),
                Tab(
                  text: 'Savings',
                ),
              ], onTap: (index) {
                switch (index) {
                  case 0:
                    //Navigator.pushNamed(context, '/');
                    const HomePage();
                    DefaultTabController.of(context).animateTo(0);
                    break;
                  case 1:
                    const Income();
                    DefaultTabController.of(context).animateTo(1);
                    break;
                  case 2:
                    const Expense();
                    DefaultTabController.of(context).animateTo(2);
                    break;
                  case 3:
                    const Saving();
                    DefaultTabController.of(context).animateTo(3);
                    break;
                }
          },),

        ));
  }
}



class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    Key? key,
    this.radius,
    this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: const [
          BoxShadow(
            color: Colors.lightBlue,
          ),
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.transparent,
          ),
        ],
      ),
      child: child,
    );
  }
}


