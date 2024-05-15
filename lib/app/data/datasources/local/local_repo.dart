import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/favorite/favorite.dart';
import 'package:movie_app/app/data/models/film/film_detail_model.dart';

abstract class LocalRepo{
  Future<Favorite> addFavoriteFilms({required FilmDetail film}); 
  Future<List<Favorite>?> getFavoriteFilms();
  Future<void> deleteItemOrAll(String? filmId);
}

@Injectable(as: LocalRepo)
class LocalRepoImpl extends LocalRepo{
  Box? box;
  LocalRepoImpl(){
    _init();
  } 

  void _init() async {
    box = await Hive.openBox<Favorite>("favoriteBox");
  }

  @override
  Future<Favorite> addFavoriteFilms({required FilmDetail film})async {
      // await box?.clear();
    if (await Hive.boxExists("favoriteBox") != true){
      _init();
    }
    if (box?.get(film.title) == null){
      final cachedImg = await cacheImage("https://images.tmdb.org/t/p/w500"+film.poster);
      final fav = Favorite(title: film.title, poster: cachedImg.path, overview: film.overview);
      box?.put(film.title, fav);
      return fav;
    }else{
      print("${film.title} already cached");
    }
    throw ArgumentError({"something went wrong adding favorite"}, "add favorite error");
  }

  @override
  Future<List<Favorite>?> getFavoriteFilms() async {
    if (await Hive.boxExists("favoriteBox")){
      final favorites = box?.values.map<Favorite>((element) => element).toList();
      return favorites;
    }
    return Future(() => null);
  }

  @override
  Future<void> deleteItemOrAll(String? filmId)async {
    if (filmId!.isEmpty){
      //delete everything
      print("delete all");
      box?.clear();
      await DefaultCacheManager().emptyCache();
    }else{
      box?.delete(filmId);
      print("deleting $filmId");
    }
    return Future(() => null);
  }

  Future<File> cacheImage(String url) async {
    return await DefaultCacheManager().getSingleFile(url);
  } 
} 