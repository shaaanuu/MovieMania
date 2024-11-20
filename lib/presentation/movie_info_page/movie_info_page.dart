import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../infrastruture/get_images.dart';

class MovieInfoPage extends StatelessWidget {
  const MovieInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as int;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Movie detail',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView(
        children: [
          kHeight10,
          kHeight10,
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.49,
                  height: 264,
                  decoration: BoxDecoration(
                    color: const Color(0xFF171B39),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.52,
                  height: 258,
                  decoration: BoxDecoration(
                    color: const Color(0xFF272A46),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.55,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(moviesList[arg].image),
                    ),
                  ),
                ),
              ),
            ],
          ),
          kHeight10,
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              moviesList[arg].title,
              style: const TextStyle(
                color: Color(0xFFcdd6f4),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              moviesList[arg].overview,
              style: const TextStyle(
                color: Color(0xFFbac2de),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
