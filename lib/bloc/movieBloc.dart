import 'dart:async';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:show_time/models/moviemodel.dart';
import 'package:show_time/repository/MovieRepository.dart';
import 'package:show_time/ui/dashboard.dart';

class MovieBloc {
  bool refresh = true;
  StreamController<Movie> _streamController = StreamController<Movie>();

  StreamSink<Movie> get streamSink => _streamController.sink;
  Stream<Movie> get streamOutput => _streamController.stream;

  MovieBloc() {
    //_streamController.stream.listen(onData);
  }
  void getMovieList(String category) {
    MovieRepository movieRepository = MovieRepository();
    Future<Movie> movieList = movieRepository.getMovieList(category);
    movieList.then((movie) {
      streamSink.add(movie);
    });
    
  }

  dispose() {
    _streamController.close();
  }
}
