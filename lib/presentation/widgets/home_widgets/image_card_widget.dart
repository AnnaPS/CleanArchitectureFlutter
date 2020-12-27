import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  ImageCardWidget(this._episod);
  final Result _episod;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Hero(
          tag: _episod.id,
          child: Image.network(
            'https://www.vodafone.es/c/statics/imagen/img_OG_Rick_y_Morty_T4_V2.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
