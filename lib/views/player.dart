import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/consts/colors.dart';
import 'package:music_app/consts/text_style.dart';
import 'package:music_app/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final SongModel data;

  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 300,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: QueryArtworkWidget(
                  id: data.id,
                  type: ArtworkType.AUDIO,
                  artworkHeight: double.infinity,
                  artworkWidth: double.infinity,
                  nullArtworkWidget: Icon(
                    Icons.music_note,
                    size: 48,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      data.displayNameWOExt,
                      style: ourStyle(
                        color: bgDarkColor,
                        size: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      data.artist.toString(),
                      style: ourStyle(
                        color: bgDarkColor,
                        size: 17,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '0:0',
                          style: ourStyle(color: bgDarkColor),
                        ),
                        Expanded(
                          child: Slider(
                            thumbColor: sliderColor,
                            inactiveColor: bgColor,
                            activeColor: sliderColor,
                            value: 0.0,
                            onChanged: (newValue) {},
                          ),
                        ),
                        Text(
                          '04:00',
                          style: ourStyle(color: bgDarkColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_previous_rounded,
                            size: 45,
                          ),
                        ),
                        Obx(
                          () => CircleAvatar(
                            radius: 35,
                            backgroundColor: bgDarkColor,
                            child: Transform.scale(
                              scale: 3,
                              child: IconButton(
                                onPressed: () {
                                  if (controller.isPlaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPlaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPlaying(true);
                                  }
                                },
                                icon: controller.isPlaying.value
                                    ? Icon(
                                        Icons.pause,
                                        color: whiteColor,
                                      )
                                    : Icon(
                                        Icons.play_arrow_rounded,
                                        color: whiteColor,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.skip_next_rounded,
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
