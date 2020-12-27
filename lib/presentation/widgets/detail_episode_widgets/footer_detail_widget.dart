import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:flutter/material.dart';

import 'chip_widget.dart';

class FooterDetailWidget extends StatelessWidget {
  const FooterDetailWidget(this._dataProvider);

  final DataProvider _dataProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text(
            _dataProvider
                .characterFromEpisode[_dataProvider.characterSelected].name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: [
            ChipWidget(
                _dataProvider
                    .characterFromEpisode[_dataProvider.characterSelected]
                    .species,
                Colors.green),
            ChipWidget(
                _dataProvider
                    .characterFromEpisode[_dataProvider.characterSelected]
                    .gender,
                Colors.orange),
            ChipWidget(
                _dataProvider
                    .characterFromEpisode[_dataProvider.characterSelected]
                    .status,
                Colors.blue),
            ChipWidget(
                _dataProvider
                    .characterFromEpisode[_dataProvider.characterSelected]
                    .origin
                    .name,
                Colors.purple),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.lightGreen,
                size: 50,
              ),
              Text(
                'Last location',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              )
            ],
          ),
        ),
        ChipWidget(
            _dataProvider.characterFromEpisode[_dataProvider.characterSelected]
                .location.name,
            Colors.indigoAccent)
      ],
    );
  }
}
