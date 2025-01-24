import 'package:flutter/material.dart';

import '../../infrastruture/movie.dart';
import 'movie_type_widget.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({Key? key, required this.moviesList}) : super(key: key);

  final List<Movie> moviesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: moviesList.length,
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
