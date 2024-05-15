// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/data/datasources/local/local_repo.dart' as _i6;
import '../../app/data/datasources/remote/remote_film_detail.dart' as _i3;
import '../../app/data/datasources/remote/remote_film_repo.dart' as _i5;
import '../../app/data/datasources/remote/remote_utils.dart' as _i4;
import '../../app/data/repo/film_detail_repo.dart' as _i7;
import '../../app/data/repo/film_repo.dart' as _i8;
import '../../app/modules/favorites/controller/favorite_controller.dart'
    as _i12;
import '../../app/modules/film_details/controller/film_detail_controller.dart'
    as _i11;
import '../../app/modules/Home/controller/home_controller.dart' as _i10;
import '../../app/services/app_service.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.RemoteFilmDetail>(() => _i3.RemoteFilmDetailImpl());
  gh.factory<_i4.RemoteUtils>(() => _i4.RemoteUtilsImpl());
  gh.factory<_i5.RemoteFilmRepo>(
      () => _i5.RemoteFilmRepoImpl(gh<_i4.RemoteUtils>()));
  gh.factory<_i6.LocalRepo>(() => _i6.LocalRepoImpl());
  gh.factory<_i7.FilmDetailRepo>(() => _i7.FilmDetailRepoImpl(
        gh<_i3.RemoteFilmDetail>(),
        gh<_i6.LocalRepo>(),
      ));
  gh.factory<_i8.FilmRepo>(() => _i8.FilmRepoImpl(gh<_i5.RemoteFilmRepo>()));
  gh.lazySingleton<_i9.AppService>(() => _i9.AppService(
        gh<_i8.FilmRepo>(),
        gh<_i7.FilmDetailRepo>(),
        gh<_i6.LocalRepo>(),
      ));
  gh.factory<_i10.HomeController>(
      () => _i10.HomeController(gh<_i9.AppService>()));
  gh.factory<_i11.FilmDetailController>(
      () => _i11.FilmDetailController(gh<_i9.AppService>()));
  gh.factory<_i12.FavoriteController>(
      () => _i12.FavoriteController(gh<_i9.AppService>()));
  return getIt;
}
