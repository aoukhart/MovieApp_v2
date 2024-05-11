import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/datasources/remote/remote_utils.dart';

abstract class RemoteFilmRepo{
  Future <Map<String, dynamic>> fetchFilms();
}

@Injectable(as: RemoteFilmRepo)
class RemoteFilmRepoImpl extends RemoteFilmRepo{
  final RemoteUtils remoteUtils;
  RemoteFilmRepoImpl(this.remoteUtils);

  @override
  Future <Map<String, dynamic>> fetchFilms() async {
    final popular = await remoteUtils.fetchPopularFilms();
    final topRated = await remoteUtils.fetchTopRatedFilms();
    final Map<String, dynamic> films = Map.from({"popular" : popular, "topRated": topRated});
    return films;

  }
}