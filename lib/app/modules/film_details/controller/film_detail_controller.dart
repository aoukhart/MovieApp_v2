import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/film_detail_model.dart';
import 'package:movie_app/app/services/app_service.dart';
import 'package:movie_app/core/loading/loading_state.dart';


@Injectable()
class FilmDetailController extends GetxController{

  final AppService appService;
  FilmDetailController(this.appService);

  Rx<FilmDetail?> film = Rx(null);
  Rx<LoadingState> pageState = Rx<LoadingState>(LoadingState.empty);

  void onInit(){
    super.onInit();
    getDetails();
  }

  Future<void> getDetails() async {
      pageState.value = LoadingState.loading;
      final movieId = Get.arguments['movie_id'];
      if(movieId == null) return;
      film.value = await appService.getFilmDetail(id: movieId);
      pageState.value = LoadingState.loaded;
  }

}