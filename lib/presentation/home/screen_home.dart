import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../infrastruture/get_images.dart';
import '../widgets/movie_category.dart';
import '../widgets/movie_type_txt.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(moviesList[0].image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBar(
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
                          backgroundColor:
                              const Color(0xFF45475a).withOpacity(0.5),
                          foregroundColor: const Color(0xFFcdd6f4),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF1e1e2e),
                        blurRadius: 50,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFcdd6f4),
                          backgroundColor:
                              const Color(0xFF45475a).withOpacity(0.8),
                        ),
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: const Text("Play"),
                        onPressed: () => Navigator.pushNamed(
                          context,
                          "/info",
                          arguments: 0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFcdd6f4),
                        ),
                        child: const Text("Details"),
                        onPressed: () => Navigator.pushNamed(
                          context,
                          "/info",
                          arguments: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          kHeight10,
          const MovieTypeText(txt: 'Movies'),
          const MovieCategory(),
          kHeight10,
          const MovieTypeText(txt: 'TV shows'),
          const MovieCategory(),
        ],
      ),
    );
  }
}
