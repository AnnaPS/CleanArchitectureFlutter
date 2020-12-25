import 'package:clean_architecture_app/data/service/data_api_service.dart';
import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/data/repository/data_repository.dart';

class DataRepositoryImpl extends DataRepository {
  final DataApiService _apiService;

  DataRepositoryImpl(this._apiService) : assert(_apiService != null);
  @override
  Future<EpisodePage> getEpisodePage() async {
    return await _apiService.getEpisodePage();
  }
}
