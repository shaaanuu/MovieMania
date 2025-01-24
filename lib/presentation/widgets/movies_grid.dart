import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../infrastruture/movie.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> moviesList;

  const MovieGrid({
    Key? key,
    required this.moviesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index < 2) SizedBox(height: index % 2 * 40.0),
              AspectRatio(
                aspectRatio: 2 / 3,
                child: ImageTile(index: index, moviesList: moviesList),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 4),
                child: Text(
                  moviesList[index].title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: moviesList.length,
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.index,
    required this.moviesList,
  }) : super(key: key);

  final int index;
  final List<Movie> moviesList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/info',
          arguments: index,
        ),
        child: Image.network(
          moviesList[index].image,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey,
            child: const Icon(
              Icons.error,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
