class MovieModel {
  final String title;
  final String image;
  final String overview;
  final String? backdropPath;
  final int id;
  final List<int> genreIds;
  final String mediaType;
  final String originalLanguage;
  final double voteAverage;
  final int voteCount;
  final String? releaseDate;

  MovieModel({
    required this.title,
    required this.image,
    required this.overview,
    this.backdropPath,
    required this.id,
    required this.genreIds,
    required this.mediaType,
    required this.originalLanguage,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
  });

  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w500/$backdropPath'
      : '';

  String get formattedRating => voteAverage.toStringAsFixed(1);

  String get year => releaseDate != null && releaseDate!.isNotEmpty
      ? releaseDate!.substring(0, 4)
      : '';
}
