import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/app/data/models/favorite/favorite.dart';
import 'package:movie_app/app/routes/app_pages.dart';
import 'package:movie_app/core/di/injection.dart';

void main() async {
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  runApp(GetMaterialApp(
    title: "Movie App v2",
    debugShowCheckedModeBanner: false,
    initialRoute: Pages.initial_routes,
    getPages: Pages.pages,
  ));
}



