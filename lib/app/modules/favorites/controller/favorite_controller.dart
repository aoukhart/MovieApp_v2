import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/app/data/models/favorite/favorite.dart';
import 'package:movie_app/app/services/app_service.dart';
import 'package:movie_app/core/loading/loading_state.dart';


@Injectable()
class FavoriteController extends GetxController{
  Rx<LoadingState> pageState = Rx(LoadingState.empty);
  final AppService appService;
  FavoriteController(this.appService);
  RxList<Favorite> get favorite => appService.favorite;
  // RxBool hasConection =

  @override
  void onInit() async {
    super.onInit();
    await getFavorite();
  }


  @override
  void refresh()async{
    super.refresh();
    await appService.getFavorite();
    if (favorite.isEmpty) pageState.value = LoadingState.empty;
  }
  Future<void> getFavorite() async {
    try{
      pageState.value = LoadingState.loading;
      await appService.getFavorite();
      pageState.value = LoadingState.loaded;
      if (favorite.isEmpty) pageState.value = LoadingState.empty;
    }catch(e){
      pageState.value = LoadingState.error;
    }
    return Future(() => null);
  }

  Future<void> deleteFilms(int index) async {
    if (index < 0) {
      pageState.value == LoadingState.empty;
    }
    await appService.deleteFilmOrAll(index);
    return Future(() => null);
  }
}