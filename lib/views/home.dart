import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_app/consts/colors.dart';
import 'package:music_app/consts/text_style.dart';
import 'package:music_app/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: whiteColor,
            ),
            onPressed: () {},
          )
        ],
        leading: Icon(
          Icons.sort_rounded,
          color: whiteColor,
        ),
        title: Text(
          'Beats',
          style: ourStyle(),
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No song fount',
                style: ourStyle(),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    //clipBehavior: Clip.antiAlias
                    margin: EdgeInsets.only(bottom: 4),
                    child: Obx(
                      () => ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        tileColor: bgColor,
                        title: Text(
                          snapshot.data![index].displayNameWOExt,
                          style: ourStyle(size: 15),
                        ),
                        subtitle: Text(
                          '${snapshot.data![index].artist}',
                          style: ourStyle(size: 15),
                        ),
                        leading: QueryArtworkWidget(
                          id: snapshot.data![index].id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        trailing: controller.playIndex.value == index &&
                                controller.isPlaying.value
                            ? Icon(
                                Icons.play_arrow,
                                color: whiteColor,
                                size: 26,
                              )
                            : null,
                        onTap: () {
                          controller.playSong(snapshot.data![index].uri, index);
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
        initialData: [],
      ),
    );
  }
}
