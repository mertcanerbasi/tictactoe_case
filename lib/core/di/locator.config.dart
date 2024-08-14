// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:tictactoe_case/core/di/app_module.dart' as _i377;
import 'package:tictactoe_case/core/localdata/local_data_source.dart' as _i802;
import 'package:tictactoe_case/core/repository/games_repository.dart' as _i99;
import 'package:tictactoe_case/presentation/create_game/create_game_page.vm.dart'
    as _i839;
import 'package:tictactoe_case/presentation/game_list/game_list_page.vm.dart'
    as _i998;
import 'package:tictactoe_case/presentation/game_screen/game_screen.vm.dart'
    as _i744;
import 'package:tictactoe_case/presentation/name_entry/name_entry_page.vm.dart'
    as _i576;
import 'package:tictactoe_case/presentation/splash/splash_page.vm.dart'
    as _i761;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i802.LocalDataSource>(
        () => _i802.LocalDataSourceImpl(gh<_i792.GetStorage>()));
    await gh.factoryAsync<_i792.GetStorage>(
      () => appModule.storage,
      preResolve: true,
    );
    await gh.factoryAsync<_i454.Supabase>(
      () => appModule.supabase,
      preResolve: true,
    );
    gh.factory<_i99.GamesRepository>(() => _i99.GamesRepository());
    gh.factory<_i761.SplashViewModel>(
        () => _i761.SplashViewModel(gh<_i802.LocalDataSource>()));
    gh.factory<_i576.NameEntryViewModel>(
        () => _i576.NameEntryViewModel(gh<_i802.LocalDataSource>()));
    gh.factory<_i839.CreateGameViewModel>(() => _i839.CreateGameViewModel(
          gh<_i99.GamesRepository>(),
          gh<_i802.LocalDataSource>(),
        ));
    gh.factory<_i998.GamesListViewModel>(() => _i998.GamesListViewModel(
          gh<_i99.GamesRepository>(),
          gh<_i802.LocalDataSource>(),
        ));
    gh.factory<_i744.GameScreenViewModel>(() => _i744.GameScreenViewModel(
          gh<_i99.GamesRepository>(),
          gh<_i802.LocalDataSource>(),
        ));
    return this;
  }
}

class _$AppModule extends _i377.AppModule {}
