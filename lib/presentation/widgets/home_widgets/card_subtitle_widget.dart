import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:flutter/material.dart';

class CardSubtitleWidget extends StatelessWidget {
  CardSubtitleWidget(this._episod);
  final Result _episod;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 15,
      child: Text(
        _episod.airDate,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
