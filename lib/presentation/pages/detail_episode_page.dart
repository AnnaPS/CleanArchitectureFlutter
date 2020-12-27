import 'package:clean_architecture_app/data/models/characters.dart';
import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailEpisodePage extends StatefulWidget {
  final Result _episod;
  DetailEpisodePage(this._episod);

  @override
  _DetailEpisodePageState createState() => _DetailEpisodePageState();
}

class _DetailEpisodePageState extends State<DetailEpisodePage> {
  final List<Character> characterList = [];
  var provider;
  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false)
        .getCharacterFromEpisode(widget._episod.characters);
    characterList.add(context.read<DataProvider>().characterFromEpisode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    characterList.forEach((element) {
      print(element.created);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode ${widget._episod.episode}'),
      ),
      body: Container(),
    );
  }
}
