import 'dart:convert';

import 'package:show_time/constant.dart';
import 'package:show_time/models/moviemodel.dart';
import 'package:http/http.dart' as http;

class APIProvider {
  static Future<Movie> fetchMovieDetails(String category) async {
    final response = await http.get(Constant.BASE_URL +
        category +
        '?api_key=${Constant.API_KEY}');
        
    print(response.body);
    return Movie.json(json.decode(response.body));
  }
}
