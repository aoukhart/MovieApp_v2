
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_cache_manager/file.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:movie_app/app/modules/favorites/controller/favorite_controller.dart';
import 'package:movie_app/core/di/injection.dart';
import 'package:movie_app/core/loading/loading_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
  final controller = Get.put(getIt<FavoriteController>());
    return Scaffold(
            backgroundColor: const Color.fromARGB(255, 41, 34, 34),
      appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 90, 74, 74),
      title: const Text("Favorite Movies")),
      body: Obx(() {
        final favorite = controller.favorite.value;

      return switch (controller.pageState.value){
        LoadingState.loading => const Center(child: CircularProgressIndicator(),),
        LoadingState.loaded => Stack(
          children: [
              ListView.builder(
              itemCount: favorite.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(125, 90, 74, 74)
                      ),
                      height: 150,
                      child: Row(
                        
                        children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(File(favorite[index].poster))),
                          const SizedBox(width: 20,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: favorite[index].overview.isNotEmpty ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                              mainAxisAlignment:  favorite[index].overview.isNotEmpty ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                              children: [
                                Text(favorite[index].title,
                                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                                Text(favorite[index].overview,
                                  overflow: TextOverflow.ellipsis,maxLines: 3, style: const TextStyle(color: Colors.white54))
                            ],),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: () { 
                              controller.appService.deleteFilmOrAll(index);
                            },
                            icon: const Icon(Icons.delete,color: Color.fromARGB(200, 27, 21, 21),size: 30)
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonBar(

                  buttonHeight: 50,
                  buttonAlignedDropdown: true,
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size.fromHeight(55)),
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 90, 74, 74))
                      )
                      ,onPressed: () {
                        controller.appService.deleteFilmOrAll(-1);
                        controller.refresh();
                        // controller.favorite.clear();
                    }, child: 
                  const Text("     Delete all     ", style: TextStyle(color: Colors.white),)
                    
                    )
                // IconButton(icon: const Icon(Icons.delete_forever_rounded),onPressed: () {
                  
                // },)
                ,
                ],)
              )
            ],
        ),
        LoadingState.error => Text("error"),
        LoadingState.empty => Center(
          child: Text("No films liked", style: TextStyle(color: Colors.white38),),
        )
      };
      }) 
      ,
    );
  }
}