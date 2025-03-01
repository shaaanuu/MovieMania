import 'package:flutter/material.dart';

import '../../model/movie.dart';

class ScreenCategories extends StatefulWidget {
  const ScreenCategories({super.key, required this.moviesList});
  final List<MovieModel> moviesList;

  @override
  State<ScreenCategories> createState() => _ScreenCategoriesState();
}

class _ScreenCategoriesState extends State<ScreenCategories> {
  final Map<int, String> genreMap = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western',
  };

  int? selectedGenreId;

  // Get all unique genre IDs from movies list
  Set<int> get uniqueGenreIds {
    final Set<int> genres = {};
    for (var movie in widget.moviesList) {
      genres.addAll(movie.genreIds);
    }
    return genres;
  }

  // Get movies filtered by selected genre
  List<MovieModel> get filteredMovies {
    if (selectedGenreId == null) return [];

    return widget.moviesList
        .where((movie) => movie.genreIds.contains(selectedGenreId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Genre chips
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: uniqueGenreIds.map((genreId) {
                final bool isSelected = selectedGenreId == genreId;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    selected: isSelected,
                    label: Text(
                      genreMap[genreId] ?? 'Unknown',
                      style: TextStyle(
                        color:
                            isSelected ? Colors.white : const Color(0xFFcdd6f4),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selectedColor: const Color(0xFF89b4fa),
                    backgroundColor: const Color(0xFF313244),
                    onSelected: (selected) {
                      setState(() {
                        selectedGenreId = selected ? genreId : null;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        // Movie list
        Expanded(
          child: selectedGenreId == null
              ? const Center(
                  child: Text(
                    'Select a category to view movies',
                    style: TextStyle(color: Color(0xFFbac2de)),
                  ),
                )
              : filteredMovies.isEmpty
                  ? const Center(
                      child: Text(
                        'No movies found for this category',
                        style: TextStyle(color: Color(0xFFbac2de)),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          color: const Color(0xFF313244),
                          elevation: 2,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                movie.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              movie.title,
                              style: const TextStyle(
                                color: Color(0xFFcdd6f4),
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: movie.mediaType == 'movie'
                                            ? Colors.blue.withAlpha(180)
                                            : Colors.green.withAlpha(180),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        movie.mediaType == 'movie'
                                            ? 'Movie'
                                            : 'TV',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    if (movie.year.isNotEmpty)
                                      Text(
                                        movie.year,
                                        style: const TextStyle(
                                          color: Color(0xFFbac2de),
                                          fontSize: 12,
                                        ),
                                      ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      movie.formattedRating,
                                      style: const TextStyle(
                                        color: Color(0xFFcdd6f4),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  movie.overview,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFFbac2de),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/info',
                              arguments: widget.moviesList.indexWhere(
                                (m) => m.id == movie.id,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
