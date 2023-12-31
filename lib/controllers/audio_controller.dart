import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }
// gets the url from the audio
  playSong(String? uri) {
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),

        
      );
      audioPlayer.play();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
// checks the device permission for storage
  checkPermission() async {
    var perm = await Permission.storage.request();

    if (perm.isGranted) {
    } else {
      checkPermission();
    }
  }
}
