
class Film{
  int id;
  String title;
  String poster;
  Film({
    required this.id,
    required this.title,
    required this.poster
  });

  factory Film.fromJson(Map<String, dynamic> json){
    return Film(
      id: json['id'],
      title: json['title'],
      poster: json['poster_path']
      );
  }
}