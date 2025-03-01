import 'package:flutter/material.dart';

import '../../model/movie.dart';
import '../widgets/movie_category.dart';
import '../widgets/movie_type_txt.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({
    super.key,
    required this.moviesList,
  });

  final List<MovieModel> moviesList;

  final List<String> movieCategoryType = const [
    'Top rated',
    'Trending',
    'Horror',
    'Romance',
    'Comedy',
    'Drama',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieCategoryType.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            MovieTypeText(txt: movieCategoryType[index]),
            MovieCategory(moviesList: moviesList),
          ],
        ),
      ),
    );
  }
}
