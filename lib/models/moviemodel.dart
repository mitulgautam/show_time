import 'package:show_time/bloc/movieBloc.dart';

class Movie {
  List<MovieData> data = [];

  Movie.json(Map<String, dynamic> json) {

    for (int i = 0; i < json['results'].length; i++) {
      MovieData _data = MovieData(json['results'][i]);
      data.add(_data);
    }

  }
}

class MovieData {
  int _id;
  String _title;
  String _description;
  String _banner;

  MovieData(data) {
    _id = data['id'];
    _title = data['title'];
    _description = data['overview'];
    _banner = data['poster_path'];
  }

  String get description => _description;

  int get id => _id;

  String get title => _title;

  String get poster => _banner;
}
