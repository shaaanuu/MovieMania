import 'package:flutter/material.dart';

import '../../infrastruture/movie.dart';
import '../widgets/movies_grid.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key, required this.moviesList}) : super(key: key);

  final List<Movie> moviesList;

  @override
  Widget build(BuildContext context) {
    return MovieGrid(moviesList: moviesList);
  }
}
