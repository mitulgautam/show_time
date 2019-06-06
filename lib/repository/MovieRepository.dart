import 'package:show_time/models/moviemodel.dart';
import 'package:show_time/resources/apiprovider.dart';

class MovieRepository {

  Future<Movie> getMovieList(String category) {
    Future<Movie> movies = APIProvider.fetchMovieDetails(category);
    return movies;
  }
}
