import 'package:flutter/material.dart';

class AnimatedMenuButton extends StatefulWidget {
  const AnimatedMenuButton({super.key});

  @override
  State<AnimatedMenuButton> createState() => _AnimatedMenuButtonState();
}

class _AnimatedMenuButtonState extends State<AnimatedMenuButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),

          /// Using The Stack Below the Menu
          child: Stack(
            children: [
              AnimatedPositioned(
                top: 6 + selectedIndex * 80,
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.elasticOut,
                child: Container(
                  height: 56,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurpleAccent),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavigationItem(
                    isSelected: selectedIndex == 0,
                    onClick: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    Navigator.pushNamed(context, '/');},
                  navigationItemText: "HomePage"),
                  NavigationItem(
                    isSelected: selectedIndex == 1,
                    onClick: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    Navigator.pushNamed(context, '/expenses');},
                    navigationItemText: 'Expenses',
                  ),
                  NavigationItem(
                    isSelected: selectedIndex == 2,
                    onClick: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    Navigator.pushNamed(context, '/income');},
                  navigationItemText: "Income"),
                  NavigationItem(
                    isSelected: selectedIndex == 3,
                    onClick: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    Navigator.pushNamed(context, '/savings');},
                  navigationItemText: "Savings")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final bool isSelected;
  final Function()? onClick;
  final String navigationItemText;

  const NavigationItem({super.key, this.isSelected = false, this.onClick,
  required this.navigationItemText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder(
                  tween: ColorTween(
                    begin: isSelected ? Colors.grey : Colors.white,
                    end: isSelected ? Colors.white : Colors.grey,
                  ),
                  duration: const Duration(milliseconds: 100),
                  builder: (context, value, _) => Icon(
                        Icons.account_balance_outlined,
                        color: value as Color,
                      )),
              const SizedBox(
                width: 16,
              ),

              /// Same Following
              Expanded(
                child: TweenAnimationBuilder(
                    tween: ColorTween(
                      begin: isSelected ? Colors.grey : Colors.white,
                      end: isSelected ? Colors.white : Colors.grey,
                    ),
                    duration: const Duration(milliseconds: 100),
                    builder: (context, value, _) => Text(
                          navigationItemText,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: value as Color),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}