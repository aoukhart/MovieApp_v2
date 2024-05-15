import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/film/film_model.dart';

abstract class RemoteUtils{
  Future <List<Film>?> fetchPopularFilms();
  Future <List<Film>?> fetchTopRatedFilms();
}

@Injectable(as: RemoteUtils)
class RemoteUtilsImpl extends RemoteUtils{

  @override
  Future<List<Film>?> fetchPopularFilms() async {
  final dio = Dio();
    final response = await dio.get('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=012e430fc4f04aafc63ae4ab7412b03a');
    if (response.statusCode == 200){
      final List<dynamic> data = response.data["results"];
      final List<Film> popularFilms = List.from(data.map((element) => Film.fromJson(element)));
      return popularFilms;
    }
    return Future.value(null);
  }

  @override
  Future<List<Film>?> fetchTopRatedFilms() async {
    final dio = Dio();
    final response = await dio.get('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=012e430fc4f04aafc63ae4ab7412b03a');
    if (response.statusCode == 200){
      final List<dynamic> data = response.data["results"];
      final List<Film> topRated = List.from(data.map((element) => Film.fromJson(element)));
      return topRated;
    }
    return Future.value(null);
  }
}