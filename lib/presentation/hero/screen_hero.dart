import 'package:flutter/material.dart';

import '../categories/screen_categories.dart';
import '../home/screen_home.dart';

class ScreenHero extends StatelessWidget {
  final ValueNotifier<int> btmnavbarNotifier = ValueNotifier(0);

  ScreenHero({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const ScreenHome(),
      const ScreenCategories(),
    ];

    List<NavigationDestination> navigationDestinations = const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
        selectedIcon: Icon(Icons.home),
      ),
      NavigationDestination(
        icon: Icon(Icons.category_outlined),
        label: 'Categories',
        selectedIcon: Icon(Icons.category),
      ),
    ];

    return ValueListenableBuilder(
      valueListenable: btmnavbarNotifier,
      builder: (context, int currentIndex, _) => Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: NavigationBar(
          destinations: navigationDestinations,
          selectedIndex: currentIndex,
          onDestinationSelected: (newIndex) =>
              btmnavbarNotifier.value = newIndex,
        ),
      ),
    );
  }
}
