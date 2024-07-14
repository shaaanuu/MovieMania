import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../common_widgets/movie_category.dart';
import '../common_widgets/movie_type_txt.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListView.builder(
        itemCount: movieCategoryType.length,
        itemBuilder: (context, index) => Column(
          children: [
            kHeight10,
            MovieTypeText(txt: movieCategoryType[index]),
            const MovieCategory(),
          ],
        ),
      ),
    );
  }
}
