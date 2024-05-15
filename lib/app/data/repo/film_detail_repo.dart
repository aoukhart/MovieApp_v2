import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/datasources/local/local_repo.dart';
import 'package:movie_app/app/data/datasources/remote/remote_film_detail.dart';
// import 'package:movie_app/app/data/models/favorite/favorite.dart';
import 'package:movie_app/app/data/models/film/film_detail_model.dart';

abstract class FilmDetailRepo{
  Future<FilmDetail?> getFilmDetails({required int id});
  // Future<void> addFavoriteFilm({required FilmDetail film});
  // Future<List<Favorite>?> getFavoriteFilms();
}

@Injectable(as: FilmDetailRepo)
class FilmDetailRepoImpl extends FilmDetailRepo{
  final RemoteFilmDetail remoteFilmDetail;
  final LocalRepo localRepo;
  FilmDetailRepoImpl(this.remoteFilmDetail, this.localRepo);

  @override
  Future<FilmDetail?> getFilmDetails({required int id}) async {
    final details = await remoteFilmDetail.getFilmDetails(id: id);
    return details;
  }

} 