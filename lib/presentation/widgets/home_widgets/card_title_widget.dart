import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:flutter/material.dart';

class CardTitleWidget extends StatelessWidget {
  CardTitleWidget(this._episod);
  final Result _episod;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 110,
      right: 15,
      child: Text(
        _episod.name,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
