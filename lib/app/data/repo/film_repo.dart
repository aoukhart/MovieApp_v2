import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/datasources/remote/remote_film_repo.dart';

abstract class FilmRepo{
  Future<Map<String, dynamic>?> getFilms();
}

@Injectable(as: FilmRepo)
class FilmRepoImpl extends FilmRepo{

  final RemoteFilmRepo remoteFilmRepo;
  FilmRepoImpl(this.remoteFilmRepo);

  @override
  Future<Map<String, dynamic>?> getFilms() async {
    //Check Connection before choosing
    final films = await remoteFilmRepo.fetchFilms();  
    return films;
  }
}