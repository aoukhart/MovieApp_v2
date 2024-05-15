import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app/data/models/film/film_model.dart';
import 'package:movie_app/app/routes/app_routes.dart';

class MovieCarousel extends StatelessWidget {
  final List<Film> movies;
  MovieCarousel(
      {Key? key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 350,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    final id = movies[index].id;
                    Get.toNamed(Routes.FILM_DETAIL, arguments: {
                      'movie_id' : id
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 280,
                          width: 200,
                          decoration: BoxDecoration(
                            
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "https://images.tmdb.org/t/p/w500" +
                                          movies[index].poster))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 180,
                            child: Text(
                                textAlign: TextAlign.center,
                                  movies[index].title,
                              maxLines: null,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
