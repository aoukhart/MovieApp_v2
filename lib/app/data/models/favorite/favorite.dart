import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 1)
class Favorite {
  @HiveField(0)
  int id;
  
  @HiveField(1)
  String title;

  @HiveField(2)
  String poster;

  @HiveField(3)
  String overview;

  Favorite({
    required this.id,
    required this.title, 
    required this.poster, 
    required this.overview
  });
}