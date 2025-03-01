import 'package:flutter/material.dart';

import '../../model/movie.dart';
import '../categories/screen_categories.dart';
import '../home/screen_home.dart';

class ScreenHero extends StatelessWidget {
  ScreenHero({super.key, required this.moviesList});

  final ValueNotifier<int> btmnavbarNotifier = ValueNotifier(0);
  final List<MovieModel> moviesList;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ScreenHome(moviesList: moviesList),
      ScreenCategories(moviesList: moviesList),
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
        appBar: AppBar(
          title: const Text(
            "MovieMania",
            style: TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF45475a).withValues(alpha: 0.5),
                  foregroundColor: const Color(0xFFcdd6f4),
                ),
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          ],
        ),
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
