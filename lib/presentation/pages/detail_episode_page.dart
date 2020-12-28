import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:clean_architecture_app/presentation/widgets/detail_episode_widgets/character_item_widget.dart';
import 'package:clean_architecture_app/presentation/widgets/detail_episode_widgets/header_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailEpisodePage extends StatefulWidget {
  final Result _episod;
  DetailEpisodePage(this._episod);

  @override
  _DetailEpisodePageState createState() => _DetailEpisodePageState();
}

class _DetailEpisodePageState extends State<DetailEpisodePage> {
  @override
  void initState() {
    context
        .read<DataProvider>()
        .getCharacterFromEpisode(widget._episod.characters);
    if (context.read<DataProvider>().selectedItem == 0) {
      context.read<DataProvider>().setSelectedItem = 0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dataProvider = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode ${widget._episod.episode}'),
      ),
      body: dataProvider.characterFromEpisode != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderDetailWidget(widget._episod),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Characters',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                DetailItemWidget(dataProvider),
              ],
            )
          : CircularProgressIndicator(),
    );
  }
}
