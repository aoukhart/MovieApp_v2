import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/modules/Home/controller/home_controller.dart';
import 'package:movie_app/app/modules/Home/views/popular_movies.dart';
import 'package:movie_app/app/modules/Home/views/top_rated_movies.dart';
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
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 90, 74, 74),
          title: const Text('Movie App'),
        ),
        body: 
        RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: 

          // controller.pageState.value == LoadingState.error ? 
            // Text("qweqweqwe"):
           ListView(children: [
            Obx(() {
              print(controller.pageState.value);
                if (controller.pageState.value == LoadingState.loaded){
                  return PopularMovies(movies: controller.popularMovies);
                }else if (controller.pageState.value == LoadingState.loading){
                  return Container(
                    height: 320,
                    child: const Center(child: CircularProgressIndicator()));
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
            const SizedBox(height: 5),
            Obx(() {
              if (controller.pageState.value == LoadingState.loaded){
                return TopRatedMovies(movies: controller.topRatedMovies);
              }

              return Container(
                height: 320,
                child: const Center(child: CircularProgressIndicator()));             
            }),
            const SizedBox(height: 8),
          ]),
        ));
  }
}