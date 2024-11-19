import 'package:flutter/material.dart';

import '../../infrastruture/get_images.dart';
import '../widgets/movie_type_widget.dart';

class ScreenSeeMore extends StatelessWidget {
  const ScreenSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: moviesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
        ),
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
