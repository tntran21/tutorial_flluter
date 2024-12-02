import 'package:flutter/material.dart';
import 'package:tutorial_1/models/song_model.dart';
import 'package:tutorial_1/widgets/song/song_item.dart';

class SongList extends StatelessWidget {
  final List<SongModel> listSong;
  final void Function(String id)? onDetailPress;
  const SongList({super.key, required this.listSong, this.onDetailPress});

  @override
  Widget build(BuildContext context) {
    void detailPress(String id) {
      if (onDetailPress != null) {
        onDetailPress!(id);
      }
    }

    return ListView.builder(
      itemCount: listSong.length,
      itemBuilder: (context, index) {
        return SongItem(song: listSong[index], onDetailPress: detailPress);
      },
    );
  }
}
