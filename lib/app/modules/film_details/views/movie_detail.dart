import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/modules/film_details/controller/film_detail_controller.dart';
import 'package:movie_app/core/di/injection.dart';
import 'package:movie_app/core/icons/pop_corn_icon.dart';
import 'package:movie_app/core/loading/loading_state.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(getIt<FilmDetailController>());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 34, 34),
      appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 90, 74, 74),
      title: const Text("Movie detail")),
      body: Obx(() {
        if (controller.pageState.value == LoadingState.loading){
          return Center(child: CircularProgressIndicator());
        }else {
          // return Center(child: Text("${controller.film.value?.title}"));
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 10, right: 7),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "https://images.tmdb.org/t/p/w500${controller.film.value!.poster}",
                                  width: 225,
                                  //fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                /////RATING//////
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5, top: 30, right: 10),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 115,
                                    width: 95,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(60, 90, 74, 74),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 3),
                                          child: Row(
                                            children: [
                                              Container(
                                                // alignment: Alignment.center,
                                                height: 28,
                                                width: 31,
                                                child: const Icon(
                                                  Icons.videocam,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Opacity(
                                                  opacity: 0.7,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Text(
                                                      "Duration",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "${controller.film.value?.duration} min",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 3),
                                          child: Row(
                                            children: [
                                              Container(
                                                // alignment: Alignment.center,
                                                height: 32,
                                                width: 31,
                                                child: const Icon(
                                                  Icons.watch_later_outlined,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Opacity(
                                                  opacity: 0.7,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 0),
                                                    child: Text(
                                                      "Release",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          controller.film.value!.releaseDate,
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 11),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                /////GENRE/////
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    right: 10,
                                    bottom: 5,
                                  ),
                                  child: Container(
                                    height: 100,
                                    width: 95,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(125, 90, 74, 74),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              // height: 25,
                                              // width: 25,
                                              child: const Icon(
                                                PopCornIcon.Icon,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Opacity(
                                                  opacity: 0.8,
                                                  child: Text(
                                                    "Genre",
                                                    style: GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                         Padding(
                                           padding: const EdgeInsets.only(bottom: 8.0),
                                           child: Column(
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              for (int i = 0; i < controller.film.value!.genres.length && i < 2; i++) ...[
                                                Text(controller.film.value!.genres[i],textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 14, color: Colors.white, height: 1.2)),
                                              ]
                                            ],
                                           ),
                                         ),
                                      ],
                                    ),
                                  ),
                                ),
                                //////DURATION//////
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, right: 10),
                                  child: Container(
                                    height: 95,
                                    width: 95,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(200, 90, 74, 74),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Row(children: [
                                            Container(
                                              // alignment: Alignment.center,
                                              height: 28,
                                              width: 31,
                                              child: const Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Opacity(
                                                opacity: 0.7,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3),
                                                  child: Text(
                                                    "Rating",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        ),
                                        Text(
                                            controller.film.value!.rating.toStringAsFixed(1),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: RatingBar.builder(
                                            allowHalfRating: true,
                                            itemSize: 16,
                                            initialRating:
                                                controller.film.value!.rating / 2.0,
                                            itemCount: 5,
                                            direction: Axis.horizontal,
                                            onRatingUpdate: (value) {},
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 5,
                                            ),
                                            // initialRating: Data[''],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: Text(controller.film.value!.title,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))),
                        const Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Divider(
                            color: Colors.black,
                            indent: 20,
                            thickness: 1.5,
                            endIndent: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Text(
                            controller.film.value!.overview,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        )
                      ],
                    );
                  },
                );
        }
      }));
  }
}