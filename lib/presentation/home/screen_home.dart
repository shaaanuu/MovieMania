import 'package:flutter/material.dart';

import '../../infrastruture/get_images.dart';
import '../widgets/movies_grid.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MovieMania",
          style: TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton.filled(
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFF45475a).withValues(alpha: 0.5),
                foregroundColor: const Color(0xFFcdd6f4),
              ),
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: MovieGrid(moviesList: moviesList),
    );
  }
}
