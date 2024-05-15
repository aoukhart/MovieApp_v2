import 'package:get/route_manager.dart';
import 'package:movie_app/app/modules/Home/views/home_page.dart';
import 'package:movie_app/app/modules/favorites/views/favorite_view.dart';
import 'package:movie_app/app/modules/film_details/views/movie_detail.dart';
import 'package:movie_app/app/routes/app_routes.dart';

class Pages{
  static const initial_routes = Routes.HOME_PAGE;

  static final pages = [
    GetPage(name: Routes.HOME_PAGE, page: () => HomePage()),
    GetPage(name: Routes.FILM_DETAIL, page: () => MovieDetail()),
    GetPage(name: Routes.FAVORITE, page: () => FavoritePage())
  ];
}