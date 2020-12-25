import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/data/repository/data_repository.dart';

class GetEpisodePageUc {
  final DataRepository _dataRepository;

  GetEpisodePageUc(this._dataRepository) : assert(_dataRepository != null);

  Future<EpisodePage> call() async => await _dataRepository.getEpisodePage();
}
