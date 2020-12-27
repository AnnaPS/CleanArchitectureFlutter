import 'package:clean_architecture_app/data/models/characters.dart';
import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/domain/character_from_episode_uc/character_from_episode_uc.dart';
import 'package:clean_architecture_app/domain/episodepage_uc/get_episode_page_uc.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final GetEpisodePageUc _getEpisodePageUc;
  final GetCharacterFromEpisodeUC _getCharacterFromEpisodeUC;

  DataProvider(this._getEpisodePageUc, this._getCharacterFromEpisodeUC)
      : assert(_getEpisodePageUc != null),
        assert(_getCharacterFromEpisodeUC != null);

  EpisodePage _episodePage;
  String _errorMessage;

  EpisodePage get episodePage => _episodePage;
  String get errorMessage => _errorMessage;

  List<Result> get episodes => _episodePage.results;
  String get errorEpisodes => _errorMessage;

  Character _character;
  Character get characterFromEpisode => _character;

  void getEpisodes() async {
    try {
      _episodePage = await _getEpisodePageUc();
    } catch (e) {
      _errorMessage = 'error: ${e.toString()}';
    } finally {
      // Don't matter what is the result, always we want notify at the end
      notifyListeners();
    }
  }

  void getCharacterFromEpisode(List<String> urls) {
    try {
      urls.forEach((element) async {
        _character = await _getCharacterFromEpisodeUC.invoke(element);
      });
      notifyListeners();
    } catch (e) {
      _errorMessage = 'error: ${e.toString()}';
    } finally {
      notifyListeners();
    }
  }
}
