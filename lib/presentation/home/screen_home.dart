import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../widgets/movie_category.dart';
import '../widgets/movie_type_txt.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          kHeight10,
          MovieTypeText(txt: 'Movies'),
          MovieCategory(),
          kHeight10,
          MovieTypeText(txt: 'TV shows'),
          MovieCategory(),
        ],
      ),
    );
  }
}
