// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:musico/controllers/audio_controller.dart';

import '../customWidgets/categoryHeading.dart';
import '../customWidgets/customBox.dart';

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
/*
                return CustomCategories(
                  strId: snapshot.data![index].id,
                  strLength: snapshot.data!.length,
                  text: snapshot.data![index].displayNameWOExt,
                );

                return ListView(
                  children: snapshot.data!
                      .map((SongModel value) => CustomCategories(
                            strId: value.id,
                            strLength: snapshot.data!.length,
                            text: value.displayNameWOExt,
                            myIndex: 1,
                            songLists: snapshot.data,
                          ))
                      .toList(),
                );
*/
            return CustomCategories(
              songLists: snapshot.data,
            );
          }
        }),
      ),
    );
  }
}

class CustomCategories extends StatelessWidget {
  final List<SongModel>? songLists;
  const CustomCategories({
    Key? key,
    required this.songLists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            CategoryHeading(
              categoryTitle: 'Recently Played',
              subTitle: 'See ALl',
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songLists!.length,
                  itemBuilder: ((context, index) {
                    return CustomBox(
                      pictureHeight: 120,
                      pictureWidth: 130,
                      radius: BorderRadius.circular(18),
                      songId: songLists![index].id,
                      songLists: songLists,
                      songTitle: songLists![index].displayNameWOExt,
                    ).marginOnly(right: 20, top: 20);
                  })),
            ),
          ],
        ).marginSymmetric(horizontal: 15),
        // Artists sliderr
        Column(
          children: [
            CategoryHeading(
              categoryTitle: 'Artists',
              subTitle: 'See All',
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songLists!.length,
                  itemBuilder: ((context, index) {
                    return CustomBox(
                      pictureHeight: 120,
                      pictureWidth: 100,
                      radius: BorderRadius.circular(18),
                      songId: songLists![index].id,
                      songLists: songLists,
                      songTitle: songLists![index].artist.toString(),
                    ).marginOnly(right: 20, top: 20);
                  })),
            ),
          ],
        ).marginSymmetric(horizontal: 15),
        // most played
        Column(
          children: [
            CategoryHeading(
              categoryTitle: 'Most Played',
              subTitle: 'See All',
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songLists!.length,
                  itemBuilder: ((context, index) {
                    return CustomBox(
                            pictureHeight: 120,
                            pictureWidth: 120,
                            radius: BorderRadius.circular(30),
                            songId: songLists![index].id,
                            songTitle: songLists![index].title,
                            songLists: songLists)
                        .marginOnly(right: 20, top: 20);
                  })),
            ),
          ],
        ).marginSymmetric(horizontal: 15)
      ],
    );
  }
}
