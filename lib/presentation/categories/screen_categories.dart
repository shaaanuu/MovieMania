import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../infrastruture/movie.dart';
import '../widgets/movie_category.dart';
import '../widgets/movie_type_txt.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({
    Key? key,
    required this.moviesList,
  }) : super(key: key);

  final List<Movie> moviesList;

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
      itemBuilder: (context, index) => Column(
        children: [
          kHeight10,
          MovieTypeText(txt: movieCategoryType[index]),
          MovieCategory(moviesList: moviesList),
        ],
      ),
    );
  }
}
