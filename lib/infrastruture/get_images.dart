// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../core/api_key.dart';
// import '../core/constants.dart';
// import 'movie.dart';

// List<Movie> moviesList = [];

// Future getMovies() async {
//   var response = await http.get(
//     Uri.https(
//       'api.themoviedb.org',
//       '3/trending/all/day',
//       {'api_key': apiKey},
//     ),
//   );

//   var jsonData = jsonDecode(response.body);

//   for (var item in jsonData['results']) {
//     final movie = Movie(
//       title: item['title']?.toString() ?? item['name'].toString(),
//       image: baseURLImage + item['poster_path'],
//       overview: item['overview'],
//     );
//     moviesList.add(movie);
//   }
// }
