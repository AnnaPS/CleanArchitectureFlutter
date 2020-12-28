import 'package:clean_architecture_app/data/models/characters.dart';
import 'package:clean_architecture_app/data/repository/data_repository.dart';

class GetCharacterFromEpisodeUC {
  final DataRepository _dataRepository;

  GetCharacterFromEpisodeUC(this._dataRepository)
      : assert(_dataRepository != null);

  Future<Character> call(String url) async =>
      await _dataRepository.getCharactersFromEpisode(url);
}
