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
  List<Result> get episodes => _episodePage.results;

  String get errorMessage => _errorMessage;
  String get errorEpisodes => _errorMessage;

  final List<Character> _characters = [];
  List<Character> get characterFromEpisode => _characters;

  int _selectedCharacter = 0;
  int get characterSelected => _selectedCharacter;

  double _widht = 100;
  double get widthContainer => _widht;

  double _height = 100;
  double get heightContainer => _height;

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

  void getCharacterFromEpisode(List<String> urls) async {
    try {
      final charactersFuture = urls.map((e) async {
        return await _getCharacterFromEpisodeUC.invoke(e);
      }).toList();

      final myCharacters = await Future.wait(charactersFuture);
      _characters.addAll(myCharacters);
    } catch (e) {
      _errorMessage = 'error: ${e.toString()}';
    } finally {
      notifyListeners();
    }
  }

  void getCharacterSelected(int selected) {
    _selectedCharacter = selected;
    notifyListeners();
  }

  void changeContainerSize(double width, height) {
    _widht = width;
    _height = height;
    notifyListeners();
  }
}
