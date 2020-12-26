import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://www.vodafone.es/c/statics/imagen/img_OG_Rick_y_Morty_T4_V2.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
