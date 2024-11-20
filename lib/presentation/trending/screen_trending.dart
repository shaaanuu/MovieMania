import 'package:flutter/material.dart';

import '../../infrastruture/get_images.dart';
import '../widgets/movie_type_widget.dart';

class ScreenTrending extends StatelessWidget {
  const ScreenTrending({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Trending",
          style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.w400),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFF45475a),
                foregroundColor: const Color(0xFFcdd6f4),
              ),
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
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
