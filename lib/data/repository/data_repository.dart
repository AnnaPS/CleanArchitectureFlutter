import 'package:clean_architecture_app/data/models/characters.dart';
import 'package:clean_architecture_app/data/models/episodes_page.dart';

abstract class DataRepository {
  Future<EpisodePage> getEpisodePage();
  Future<Character> getCharactersFromEpisode(String url);
}
