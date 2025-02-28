import 'package:flutter/material.dart';

import '../../model/movie.dart';
import '../widgets/movies_grid.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key, required this.moviesList});

  final List<MovieModel> moviesList;

  @override
  Widget build(BuildContext context) {
    return MovieGrid(moviesList: moviesList);
  }
}
