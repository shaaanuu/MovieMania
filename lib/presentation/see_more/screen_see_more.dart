import 'package:flutter/material.dart';

import '../../infrastruture/get_images.dart';
import '../widgets/movies_grid.dart';

class ScreenSeeMore extends StatelessWidget {
  const ScreenSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MovieGrid(moviesList: moviesList),
    );
  }
}
