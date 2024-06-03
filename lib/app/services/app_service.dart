import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/datasources/local/local_repo.dart';
import 'package:movie_app/app/data/models/favorite/favorite.dart';
import 'package:movie_app/app/data/models/film/film_detail_model.dart';
import 'package:movie_app/app/data/models/film/film_model.dart';
import 'package:movie_app/app/data/repo/film_detail_repo.dart';
import 'package:movie_app/app/data/repo/film_repo.dart';

@LazySingleton()
class AppService{
  final FilmRepo filmRepo;
  final FilmDetailRepo filmDetailRepo;
  final LocalRepo localRepo;
  AppService(this.filmRepo, this.filmDetailRepo, this.localRepo);

  RxList<Film> popular = RxList();
  RxList<Film> topRated = RxList();
  RxList<Favorite> favorite = RxList();

  Future<void> getFilms() async {
    final films = await filmRepo.getFilms();
    if (films!.isEmpty == false && 
          films['popular'] != null && 
          films['topRated'] != null){      
      print(films);
      print(films['popular']);
      popular.assignAll(films["popular"]);
      topRated.assignAll(films['topRated']);
      return Future(() => null);
    }
  }

  Future<FilmDetail?> getFilmDetail({required int id}) async {
    final details = await filmDetailRepo.getFilmDetails(id: id);
    return details;
  }

  Future<void> addFavorite({required FilmDetail film}) async {
    try{
      final fav = await localRepo.addFavoriteFilms(film: film);
      if (fav.isBlank == false){
        favorite.add(fav);
      }
    }catch(e){
      print(e);
    }
    return Future(() => null);
  }

  Future<void> getFavorite() async {
    try {
      favorite.value =  await localRepo.getFavoriteFilms() as List<Favorite>;
    }catch (e){
      // TODO
      // print("*/*/*/*/*/*/*/*/*/*/*/*");

    }
     return Future(() => null);
  }

  Future<void> deleteFilmOrAll(int index) async {
    if(index < 0){
      await localRepo.deleteItemOrAll("");
      favorite.clear();
    }else{
      
      await localRepo.deleteItemOrAll(favorite.elementAt(index).title);
      favorite.removeAt(index);
    }
    return Future(() => null);
  }

  bool isFavorite(FilmDetail? film){
    try {
      favorite.value.singleWhere((element) => element.title == film!.title);
      return true;
    }catch(e){
      // print("=> $e");
      return false;
    }
  }
}