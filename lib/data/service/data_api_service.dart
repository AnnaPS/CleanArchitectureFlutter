import 'package:clean_architecture_app/data/models/characters.dart';
import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:http/http.dart' as http;

class DataApiService {
  final String _RICK_AND_MORTY_URL_EPISODES =
      'https://rickandmortyapi.com/api/episode';

  Future<EpisodePage> getEpisodePage() async {
    var episodePage;
    try {
      final result = await http.get(_RICK_AND_MORTY_URL_EPISODES);
      if (result.statusCode == 200) {
        episodePage = episodePageFromJson(result.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return episodePage;
  }

  Future<Character> getCharactersFromEpisode(String url) async {
    var result;
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        result = characterFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
