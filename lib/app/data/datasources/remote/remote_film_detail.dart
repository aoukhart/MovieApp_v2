import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/film/film_detail_model.dart';

abstract class RemoteFilmDetail{
  Future<FilmDetail?> getFilmDetails({required int id}); 
}

@Injectable(as: RemoteFilmDetail)
class RemoteFilmDetailImpl extends RemoteFilmDetail{

  @override
  Future<FilmDetail?> getFilmDetails({required int id}) async {
    final dio = Dio();
    final response = await dio.get('https://api.themoviedb.org/3/movie/$id?language=en-US&api_key=012e430fc4f04aafc63ae4ab7412b03a');
    if (response.statusCode == 200){
      return FilmDetail.fromJson(response.data);
    }
    return Future.value(null);
  }
}