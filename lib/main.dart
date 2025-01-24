import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'core/api_key.dart';
import 'core/constants.dart';
import 'infrastruture/movie.dart';
import 'presentation/hero/screen_hero.dart';
import 'presentation/details/screen_details.dart';
import 'presentation/see_more/screen_see_more.dart';

void main() async {
  final List<Movie> moviesList = [];

  var response = await http.get(
    Uri.https(
      'api.themoviedb.org',
      '3/trending/all/day',
      {'api_key': apiKey},
    ),
  );

  var jsonData = jsonDecode(response.body);

  for (var item in jsonData['results']) {
    final movie = Movie(
      title: item['title']?.toString() ?? item['name'].toString(),
      image: baseURLImage + item['poster_path'],
      overview: item['overview'],
    );
    moviesList.add(movie);
  }

  runApp(
    MyApp(moviesList: moviesList),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.moviesList,
  });

  final List<Movie> moviesList;

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
        '/info': (context) => ScreenDetails(moviesList: moviesList),
        '/seeMore': (context) => ScreenSeeMore(moviesList: moviesList),
      },
      home: ScreenHero(moviesList: moviesList),
    );
  }
}
