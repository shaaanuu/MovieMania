import 'package:flutter/material.dart';

import '../../infrastruture/get_images.dart';
import '../widgets/movies_grid.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieGrid(moviesList: moviesList);
  }
}
