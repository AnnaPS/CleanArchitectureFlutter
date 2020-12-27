import 'package:clean_architecture_app/data/repository/data_repository.dart';
import 'package:clean_architecture_app/data/repository/data_respository_impl.dart';
import 'package:clean_architecture_app/data/service/data_api_service.dart';
import 'package:clean_architecture_app/domain/character_from_episode_uc/character_from_episode_uc.dart';
import 'package:clean_architecture_app/domain/episodepage_uc/get_episode_page_uc.dart';
import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:get_it/get_it.dart';

final _injector = GetIt.instance;

void setUp() {
  _injector.registerLazySingleton<DataApiService>(() => DataApiService());
  _injector.registerLazySingleton<DataRepository>(
      () => DataRepositoryImpl(_injector<DataApiService>()));
  _injector.registerLazySingleton<DataProvider>(() => DataProvider(
      _injector<GetEpisodePageUc>(), _injector<GetCharacterFromEpisodeUC>()));
  _injector.registerLazySingleton<GetEpisodePageUc>(
      () => GetEpisodePageUc(_injector<DataRepository>()));
  _injector.registerLazySingleton<GetCharacterFromEpisodeUC>(
      () => GetCharacterFromEpisodeUC(_injector<DataRepository>()));
}
