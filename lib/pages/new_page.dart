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
              if (snapshot.data == null || !snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // return CustomCategories(
                //   strId: snapshot.data![index].id,
                //   strLength: snapshot.data!.length,
                //   text: snapshot.data![index].displayNameWOExt,
                // );

                // return ListView(
                //   children: snapshot.data!
                //       .map((SongModel value) => CustomCategories(
                //             strId: value.id,
                //             strLength: snapshot.data!.length,
                //             text: value.displayNameWOExt,
                //             myIndex: 1,
                //             songLists: snapshot.data,
                //           ))
                //       .toList(),
                // );

                return CustomCategories(
                  songLists: snapshot.data,
                );
              }
            })));
  }
}

class CustomCategories extends StatelessWidget {
  final List<SongModel>? songLists;
  // int strId;
  // int strLength;
  // String text;
  // int myIndex;

  CustomCategories({
    Key? key,
    required this.songLists,
    // required this.strId,
    // required this.strLength,
    // required this.text,
    // required this.myIndex,
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
                ).marginOnly(top: 10),
                CustomText(
                  text: 'See All',
                  fontSize: 20,
                  color: Color(0xffFF8216),
                )
              ],
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songLists!.length,
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
                              id: songLists![index].id,

                              // songLists![index].id,
                              type: ArtworkType.AUDIO),
                          SizedBox(
                            width: 120,
                            child: CustomText(
                              text: songLists![index].title,
                            ),
                          )
                        ],
                      ),
                    ).marginOnly(right: 20, top: 20);
                  })),
            ),

            ///
          ],
        ).marginSymmetric(horizontal: 15),

        //

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Artists',
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
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songLists!.length,
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      height: 190,
                      child: Column(
                        children: [
                          QueryArtworkWidget(
                              artworkQuality: FilterQuality.high,
                              artworkFit: BoxFit.cover,
                              artworkHeight: 120,
                              artworkWidth: 120,
                              artworkBorder: BorderRadius.circular(90),
                              size: 700,
                              id: songLists![index].id,
                              type: ArtworkType.AUDIO),
                          SizedBox(
                            width: 120,
                            child: CustomText(
                              text: songLists![index].title,
                            ),
                          )
                        ],
                      ),
                    ).marginOnly(right: 20, top: 20);
                  })),
            ),

            ///
          ],
        ).marginSymmetric(horizontal: 15)
      ],
    );
  }
}
