import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:clean_architecture_app/presentation/widgets/detail_episode_widgets/footer_detail_widget.dart';
import 'package:flutter/material.dart';

class DetailItemWidget extends StatelessWidget {
  DetailItemWidget(this._dataProvider);
  final DataProvider _dataProvider;

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
                        _dataProvider.changeContainerSize(150, 150);
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
        FooterDetailWidget(_dataProvider)
      ],
    );
  }
}
// height: _dataProvider.heightContainer,
//                         width: _dataProvider.widthContainer,
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.easeOut,
