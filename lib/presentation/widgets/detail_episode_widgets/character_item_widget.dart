import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  DetailItemWidget(@required this._episod, @required this._dataProvider);
  Result _episod;
  DataProvider _dataProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dataProvider.characterFromEpisode.length,
            itemBuilder: (context, index) {
              var character = _dataProvider.characterFromEpisode[index];
              return character != null
                  ? InkWell(
                      onTap: () {
                        _dataProvider.getCharacterSelected(index);
                        print('${_dataProvider.characterSelected}');
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                _dataProvider.characterFromEpisode[index].image,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text(
            _dataProvider
                .characterFromEpisode[_dataProvider.characterSelected].name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
        Row(
          children: [
            _buildChip(
                _dataProvider
                    .characterFromEpisode[_dataProvider.characterSelected]
                    .species,
                Colors.green),
            _buildChip(
                _dataProvider
                    .characterFromEpisode[_dataProvider.characterSelected]
                    .gender,
                Colors.orange),
            _buildChip(
                _dataProvider
                    .characterFromEpisode[_dataProvider.characterSelected]
                    .status,
                Colors.blue),
          ],
        ),
      ],
    );
  }

  Widget _buildChip(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        labelPadding: EdgeInsets.all(2.0),
        avatar: CircleAvatar(
          backgroundColor: Colors.white70,
          child: Text(label[0].toUpperCase()),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
