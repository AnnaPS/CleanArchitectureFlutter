import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/presentation/providers/data_provider.dart';
import 'package:flutter/material.dart';

class HeaderDetailWidget extends StatelessWidget {
  HeaderDetailWidget(@required this._epidod, @required this._dataProvider);
  Result _epidod;
  DataProvider _dataProvider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: _epidod.id,
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.green.withOpacity(0.4),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://www.vodafone.es/c/statics/imagen/img_OG_Rick_y_Morty_T4_V2.jpg',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  _epidod.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(
                _epidod.episode,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                overflow: TextOverflow.clip,
              )
            ],
          )
        ],
      ),
    );
  }
}
