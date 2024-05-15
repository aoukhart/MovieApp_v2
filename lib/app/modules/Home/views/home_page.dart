import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/Home/controller/home_controller.dart';
import 'package:movie_app/app/modules/Home/views/movieCarousel.dart';
import 'package:movie_app/app/routes/app_routes.dart';
import 'package:movie_app/core/di/injection.dart';
import 'package:movie_app/core/loading/loading_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(getIt<HomeController>());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 34, 34),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              Get.toNamed(Routes.FAVORITE);
            }, icon: const Icon(Icons.list))
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 90, 74, 74),
          title: const Text('Movie App'),
        ),
        body: 
        RefreshIndicator(
          onRefresh: controller.onRefresh,
          child:
           ListView(children: [
            Obx(() {
                if (controller.pageState.value == LoadingState.loaded){
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "TRENDING",
                          style: TextStyle(
                              color: Colors.white, fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poetsen One"),
                        ),
                      ),
                      MovieCarousel(movies: controller.popularMovies),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "TOP RATED",
                          style: TextStyle(
                              color: Colors.white, fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poetsen One"),
                        ),
                      ),
                      MovieCarousel(movies: controller.topRatedMovies),
                      const SizedBox(height: 15)
                    ],
                  );
                }else if (controller.pageState.value == LoadingState.loading){
                  return  Container(
                      height: Get.height,
                      child:const Center(
                      child: CircularProgressIndicator()));
                }
                return Container(
                  height: Get.height*0.35,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.refresh, size: 35, color: Colors.white70,),
                          Icon(Icons.arrow_downward, size: 30, color: Colors.white60,),
                        ],
                      ),
                      Center(child: Text(textAlign: TextAlign.center,"Error try reloading!\nCheck ur internet",
                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
                    ],
                  ));
            }),

          ]),
        ));
  }
}