import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/presentation/pages/detail_episode_page.dart';
import 'package:clean_architecture_app/presentation/widgets/home_widgets/card_subtitle_widget.dart';
import 'package:clean_architecture_app/presentation/widgets/home_widgets/card_title_widget.dart';
import 'package:flutter/material.dart';
import 'image_card_widget.dart';

class EpisodeCardWidget extends StatelessWidget {
  EpisodeCardWidget(this._episod);
  final Result _episod;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailEpisodePage(_episod)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              ImageCardWidget(),
              CardTitleWidget(_episod),
              CardSubtitleWidget(_episod),
            ],
          ),
        ),
      ),
    );
  }
}
