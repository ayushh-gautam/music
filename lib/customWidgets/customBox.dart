// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../constants/text.dart';

class CustomBox extends StatelessWidget {
  int songId;
  String songTitle;
  double? pictureHeight;
  double? pictureWidth;
  BorderRadius? radius;
  CustomBox({
    Key? key,
    required this.songId,
    required this.songTitle,
    required this.pictureHeight,
    required this.pictureWidth,
    required this.radius,
    required this.songLists,
  }) : super(key: key);

  final List<SongModel>? songLists;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          QueryArtworkWidget(
              artworkQuality: FilterQuality.high,
              artworkFit: BoxFit.cover,
              artworkHeight: pictureHeight!,
              artworkWidth: pictureWidth!,
              artworkBorder: radius,
              size: 700,
              id: songId,
              type: ArtworkType.AUDIO),
          SizedBox(
            width: 120,
            child: CustomText(
              text: songTitle,
            ),
          )
        ],
      ),
    );
  }
}
