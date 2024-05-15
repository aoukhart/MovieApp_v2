import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/film/film_detail_model.dart';
import 'package:movie_app/app/services/app_service.dart';
import 'package:movie_app/core/loading/loading_state.dart';


@Injectable()
class FilmDetailController extends GetxController{

  final AppService appService;
  FilmDetailController(this.appService);

  Rx<FilmDetail?> film = Rx(null);
  Rx<LoadingState> pageState = Rx<LoadingState>(LoadingState.empty);
  Rx<bool> isFavorite = Rx<bool>(false); 
  void onInit(){
    super.onInit();
    getDetails();
  }

  Future<void> getDetails() async {
      pageState.value = LoadingState.loading;
      final movieId = Get.arguments['movie_id'];
      if(movieId == null) return;
      film.value = await appService.getFilmDetail(id: movieId);
      isFavorite.value = appService.isFavorite(film.value);
      await Future.delayed(const Duration(seconds: 1));
      pageState.value = LoadingState.loaded;
  }

  Future<void> addFavorite({required FilmDetail? film}) async {
    await appService.addFavorite(film: film!);
    return Future(() => null);
  }
}