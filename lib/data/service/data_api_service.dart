import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:http/http.dart' as http;

class DataApiService {
  Future<EpisodePage> getEpisodePage() async {
    var episodePage;
    try {
      final url = 'https://rickandmortyapi.com/api/episode';
      final result = await http.get(url);
      if (result.statusCode == 200) {
        episodePage = episodePageFromJson(result.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return episodePage;
  }
}
