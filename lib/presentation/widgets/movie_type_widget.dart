import 'package:flutter/material.dart';

class MovieTypeWidget extends StatelessWidget {
  const MovieTypeWidget({
    super.key,
    required this.movieName,
    required this.poster,
  });

  final String movieName;
  final String poster;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(poster),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              movieName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 16, color: Color(0xFFcdd6f4)),
            ),
          ),
        ],
      ),
    );
  }
}
