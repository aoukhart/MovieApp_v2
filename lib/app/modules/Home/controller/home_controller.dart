import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/film_model.dart';
import 'package:movie_app/app/services/app_service.dart';
import 'package:movie_app/core/loading/loading_state.dart';

@Injectable()
class HomeController extends GetxController {
  // const HomeController({super.key});
  final AppService appService;
  HomeController(this.appService);

  Rx<LoadingState> pageState = 
            Rx<LoadingState>(LoadingState.empty);
  RxList<Film> get popularMovies => appService.popular;
  RxList<Film> get topRatedMovies => appService.topRated;

  @override
  void onInit() async{
    super.onInit();
    getFilms();
  }


  Future onRefresh() async{
    getFilms();
  }

  Future<void> getFilms() async {
    try{
      pageState.value = LoadingState.loading;
      await appService.getFilms();
      pageState.value = LoadingState.loaded;
    }catch(e){
      pageState.value = LoadingState.error;
    }
    return Future(() => null);
  }
  


}