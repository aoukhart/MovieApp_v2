
class FilmDetail{
  String title;
  String overview;
  num rating;
  List<String> genres;
  String poster;
  num duration;
  String releaseDate;
  FilmDetail({required this.title, required this.overview, required this.rating, required this.genres,
          required this.poster, required this.duration, required this.releaseDate});


  factory FilmDetail.fromJson(Map<String, dynamic> json){
    List genres = json['genres'];

    return FilmDetail(title: json['title'],
            overview: json['overview'], rating: json['vote_average'],
            genres: genres.map<String>((e) => e['name']).toList(), 
            poster: json['poster_path'], duration: json['runtime'],
            releaseDate: json['release_date']
    );
  }
}