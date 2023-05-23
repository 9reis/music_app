import 'package:flutter/material.dart';
import 'package:music_app/consts/colors.dart';
import 'package:music_app/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 100,
          itemBuilder: (context, index) {
            return Container(
              //clipBehavior: Clip.antiAlias
              margin: EdgeInsets.only(bottom: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tileColor: bgColor,
                title: Text(
                  'Music Name',
                  style: ourStyle(size: 15),
                ),
                subtitle: Text(
                  'Artist Name',
                  style: ourStyle(size: 15),
                ),
                leading: Icon(
                  Icons.music_note,
                  color: whiteColor,
                  size: 32,
                ),
                trailing: Icon(
                  Icons.play_arrow,
                  color: whiteColor,
                  size: 26,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
