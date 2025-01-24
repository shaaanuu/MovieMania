import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';
import 'model/movie.dart';
import 'presentation/hero/screen_hero.dart';
import 'presentation/details/screen_details.dart';
import 'presentation/see_more/screen_see_more.dart';

void main() async {
  final List<MovieModel> moviesList = [];

  var response = await http.get(
    Uri.https(
      'api.themoviedb.org',
      '3/trending/all/day',
      {'api_key': apiKey},
    ),
  );

  for (var item in jsonDecode(response.body)['results']) {
    moviesList.add(MovieModel(
      title: item['title']?.toString() ?? item['name'].toString(),
      image: 'https://image.tmdb.org/t/p/w500/${item['poster_path']}',
      overview: item['overview'],
    ));
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

  final List<MovieModel> moviesList;

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
