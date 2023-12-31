// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:musico/constants/colors.dart';
import 'package:musico/constants/text.dart';
import 'package:musico/controllers/audio_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AudioController());
    return Scaffold(
        body: FutureBuilder<List<SongModel>>(
            future: controller.audioQuery.querySongs(
                ignoreCase: true,
                orderType: OrderType.ASC_OR_SMALLER,
                sortType: SongSortType.SIZE,
                uriType: UriType.EXTERNAL),
            builder: ((context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                print(snapshot.data);

                return CustomCategories(
                  strId: snapshot.data![index].id,
                  strLength: snapshot.data!.length,
                  text: snapshot.data![index].displayNameWOExt,
                );
              }
            })));
  }
}

class CustomCategories extends StatelessWidget {
  int strLength;
  int myIndex;
  int strId;
  String text;
  CustomCategories({
    Key? key,
    required this.strLength,
    required this.myIndex,
    required this.strId,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Recently Played',
                  fontSize: 20,
                  color: backgroundDark,
                  fontWeight: FontWeight.w600,
                ).marginOnly(top: 1),
                CustomText(
                  text: 'See All',
                  fontSize: 20,
                  color: Color(0xffFF8216),
                )
              ],
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: strLength,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      height: 190,
                      child: Column(
                        children: [
                          QueryArtworkWidget(
                              artworkQuality: FilterQuality.high,
                              artworkFit: BoxFit.cover,
                              artworkHeight: 120,
                              artworkWidth: 140,
                              artworkBorder: BorderRadius.circular(20),
                              size: 700,
                              id: strId,
                              type: ArtworkType.AUDIO),
                          Container(
                            width: 120,
                            child: CustomText(
                              text: text,
                              color: backgroundDark,
                            ),
                          )
                        ],
                      ),
                    ).marginOnly(right: 20, top: 20);
                  })),
            ),
          ],
        ).marginSymmetric(horizontal: 15)
      ],
    );
  }
}
