import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 1)
class Favorite {
  @HiveField(0)
  String title;

  @HiveField(1)
  String poster;

  @HiveField(2)
  String overview;

  Favorite({required this.title, 
          required this.poster, 
          required this.overview
  });
}