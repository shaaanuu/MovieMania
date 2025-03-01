import 'package:flutter/material.dart';

import '../../model/movie.dart';
import 'movie_type_widget.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({super.key, required this.moviesList});

  final List<MovieModel> moviesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            '/info',
            arguments: index,
          ),
          child: MovieTypeWidget(
            movieName: moviesList[index].title,
            poster: moviesList[index].image,
          ),
        ),
      ),
    );
  }
}
