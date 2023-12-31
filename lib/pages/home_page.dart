import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:musico/constants/colors.dart';
import 'package:musico/constants/text.dart';
import 'package:musico/controllers/audio_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AudioController());
    return Scaffold(
      backgroundColor: backgroundDark,

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
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(5),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var songdata = snapshot.data![index];
                  return Container(
                    child: ListTile(
                      tileColor: backgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      leading: QueryArtworkWidget(
                        id: songdata.id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Icon(
                          Icons.music_note,
                          color: whiteColor,
                          size: 32,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.play_arrow,
                        size: 30,
                      ),
                      onTap: () {
                        controller.playSong(songdata.uri);
                      },
                      title: CustomText(
                        text: songdata.displayNameWOExt,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      subtitle: CustomText(
                        text: songdata.artist,
                        fontSize: 16,
                      ),
                    ),
                  ).marginOnly(bottom: 10);
                });
          }
        }),
      ),
    );
  }
}
