import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      labelColor: Color(0xFF5B4FE9),
      unselectedLabelColor: Colors.grey,
      indicatorColor: Color(0xFF5B4FE9),
      indicatorWeight: 2,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      tabs: [
        Tab(text: 'Home'),
        Tab(text: 'Category'),
      ],
    );
  }
}
