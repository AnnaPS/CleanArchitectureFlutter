import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/domain/episodepage_uc/get_episode_page_uc.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final GetEpisodePageUc _getEpisodePageUc;
  DataProvider(this._getEpisodePageUc) : assert(_getEpisodePageUc != null);

  EpisodePage _episodePage;
  String _errorMessage;

  EpisodePage get episodePage => _episodePage;
  String get errorMessage => _errorMessage;

  List<Result> get episodes => _episodePage.results;
  String get errorEpisodes => _errorMessage;

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
}
