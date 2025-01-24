import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../widgets/movie_category.dart';
import '../widgets/movie_type_txt.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({Key? key}) : super(key: key);

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
          const MovieCategory(),
        ],
      ),
    );
  }
}
