import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/film_detail_model.dart';
import 'package:movie_app/app/data/models/film_model.dart';
import 'package:movie_app/app/data/repo/film_detail_repo.dart';
import 'package:movie_app/app/data/repo/film_repo.dart';

@LazySingleton()
class AppService{
  final FilmRepo filmRepo;
  final FilmDetailRepo filmDetailRepo;
  AppService(this.filmRepo, this.filmDetailRepo);

  RxList<Film> popular = RxList();
  RxList<Film> topRated = RxList();

  Future<void> getFilms() async {
    final films = await filmRepo.getFilms();
    if (films!.isEmpty == false && 
          films['popular'] != null && 
          films['topRated'] != null){      
      popular.assignAll(films["popular"]);
      topRated.assignAll(films['topRated']);
    }
  }

  Future<FilmDetail?> getFilmDetail({required int id}) async {
    final details = await filmDetailRepo.getFilmDetails(id: id);
    return details;
  }
}