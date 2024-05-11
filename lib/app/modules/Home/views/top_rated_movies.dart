import 'package:flutter/material.dart';
import 'package:movie_app/app/data/models/film_model.dart';

class TopRatedMovies extends StatelessWidget {
  final List<Film> movies;
  TopRatedMovies(
      {Key? key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "TOP RATED",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Poetsen One"),
          ),
        ),
        Container(
          height: 350,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () { },
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
