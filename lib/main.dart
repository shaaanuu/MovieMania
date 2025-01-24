import 'package:flutter/material.dart';

import 'infrastruture/get_images.dart';
import 'presentation/hero/screen_hero.dart';
import 'presentation/details/screen_details.dart';
import 'presentation/see_more/screen_see_more.dart';

void main() async {
  await getMovies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1e1e2e),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Color(0xFFcdd6f4),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.transparent,
          height: 70,
          indicatorColor: const Color(0xFF45475a),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 14,
              color: Color(0xFFcdd6f4),
            ),
          ),
          iconTheme: const WidgetStatePropertyAll(
            IconThemeData(color: Color(0xFFcdd6f4)),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFcdd6f4)),
        ),
      ),
      routes: {
        '/info': (context) => const MovieDetails(),
        '/seeMore': (context) => const ScreenSeeMore(),
      },
      home: ScreenHero(),
    );
  }
}
