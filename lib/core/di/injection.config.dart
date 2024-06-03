// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/data/datasources/local/local_repo.dart' as _i7;
import '../../app/data/datasources/remote/remote_film_detail.dart' as _i4;
import '../../app/data/datasources/remote/remote_film_repo.dart' as _i6;
import '../../app/data/datasources/remote/remote_utils.dart' as _i5;
import '../../app/data/repo/film_detail_repo.dart' as _i8;
import '../../app/data/repo/film_repo.dart' as _i9;
import '../../app/modules/favorites/controller/favorite_controller.dart'
    as _i13;
import '../../app/modules/film_details/controller/film_detail_controller.dart'
    as _i12;
import '../../app/modules/Home/controller/home_controller.dart' as _i11;
import '../../app/services/app_service.dart' as _i10;
import '../network/network_check.dart' as _i3;

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
  gh.lazySingleton<_i3.NetworkCheckerImpl>(() => _i3.NetworkCheckerImpl());
  gh.factory<_i4.RemoteFilmDetail>(() => _i4.RemoteFilmDetailImpl());
  gh.factory<_i5.RemoteUtils>(() => _i5.RemoteUtilsImpl());
  gh.factory<_i6.RemoteFilmRepo>(
      () => _i6.RemoteFilmRepoImpl(gh<_i5.RemoteUtils>()));
  gh.factory<_i7.LocalRepo>(() => _i7.LocalRepoImpl());
  gh.factory<_i8.FilmDetailRepo>(() => _i8.FilmDetailRepoImpl(
        gh<_i4.RemoteFilmDetail>(),
        gh<_i7.LocalRepo>(),
      ));
  gh.factory<_i9.FilmRepo>(() => _i9.FilmRepoImpl(gh<_i6.RemoteFilmRepo>()));
  gh.lazySingleton<_i10.AppService>(() => _i10.AppService(
        gh<_i9.FilmRepo>(),
        gh<_i8.FilmDetailRepo>(),
        gh<_i7.LocalRepo>(),
      ));
  gh.factory<_i11.HomeController>(
      () => _i11.HomeController(gh<_i10.AppService>()));
  gh.factory<_i12.FilmDetailController>(
      () => _i12.FilmDetailController(gh<_i10.AppService>()));
  gh.factory<_i13.FavoriteController>(
      () => _i13.FavoriteController(gh<_i10.AppService>()));
  return getIt;
}
