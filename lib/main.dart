import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movie_app/app/routes/app_pages.dart';
import 'package:movie_app/core/di/injection.dart';

void main() {
  configureDependencies();
  runApp(GetMaterialApp(
    title: "Movie App v2",
    debugShowCheckedModeBanner: false,
    initialRoute: Pages.initial_routes,
    getPages: Pages.pages,
  ));
}



