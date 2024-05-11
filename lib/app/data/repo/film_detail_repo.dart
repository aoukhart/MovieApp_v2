import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/datasources/remote/remote_film_detail.dart';
import 'package:movie_app/app/data/models/film_detail_model.dart';

abstract class FilmDetailRepo{
  Future<FilmDetail?> getFilmDetails({required int id});
}

@Injectable(as: FilmDetailRepo)
class FilmDetailRepoImpl extends FilmDetailRepo{
  final RemoteFilmDetail remoteFilmDetail;
  FilmDetailRepoImpl(this.remoteFilmDetail);

  @override
  Future<FilmDetail?> getFilmDetails({required int id}) async {
    final details = await remoteFilmDetail.getFilmDetails(id: id);
    return details;
  }
} 