import 'package:flutter/material.dart';

import '../../model/movie.dart';
import '../widgets/movies_grid.dart';

class ScreenSeeMore extends StatelessWidget {
  const ScreenSeeMore({super.key, required this.moviesList});

  final List<MovieModel> moviesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MovieGrid(moviesList: moviesList),
    );
  }
}
