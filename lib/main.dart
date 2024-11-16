import 'package:flutter/material.dart';

import 'infrastruture/get_images.dart';
import 'presentation/main_page/screen_main.dart';
import 'presentation/movie_info_page/movie_info_page.dart';
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
      routes: {
        '/info': (context) => const MovieInfoPage(),
        '/seeMore': (context) => const ScreenSeeMore(),
      },
      debugShowCheckedModeBanner: false,
      home: ScreenMain(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF070D2D),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.transparent,
          height: 70,
          indicatorColor: Colors.grey.withOpacity(0.15),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 14,
              color: Color(0xFF546EE5),
            ),
          ),
        ),
      ),
    );
  }
}
