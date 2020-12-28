import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:clean_architecture_app/presentation/widgets/detail_episode_widgets/footer_detail_widget.dart';
import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  DetailItemWidget(this._dataProvider);
  final DataProvider _dataProvider;
  final _smallSize = 80.0;
  final _highSize = 100.0;

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
                  ? GestureDetector(
                      onTap: () {
                        _dataProvider.setCharacterSelected = index;
                        _dataProvider.setSelectedItem = _dataProvider
                            .characterFromEpisode[
                                _dataProvider.characterSelected]
                            .id;
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              height: _dataProvider.selectedItem ==
                                      _dataProvider
                                          .characterFromEpisode[index].id
                                  ? _highSize
                                  : _smallSize,
                              width: _dataProvider.selectedItem ==
                                      _dataProvider
                                          .characterFromEpisode[index].id
                                  ? _highSize
                                  : _smallSize,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.green[400].withOpacity(0.8),
                                    width: _dataProvider.selectedItem ==
                                            _dataProvider
                                                .characterFromEpisode[index].id
                                        ? 5.0
                                        : 0.0),
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(_dataProvider
                                      .characterFromEpisode[index].image),
                                  fit: BoxFit.cover,
                                ),
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
        FooterDetailWidget(_dataProvider)
      ],
    );
  }
}
