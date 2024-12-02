import 'package:flutter/material.dart';
import 'package:tutorial_1/models/song_model.dart';

class SongItem extends StatelessWidget {
  final SongModel song;
  final void Function(String id)? onDetailPress;

  const SongItem({super.key, required this.song, this.onDetailPress});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://images.pexels.com/photos/29410748/pexels-photo-29410748/free-photo-of-vintage-car-cruising-by-the-seaside-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

    void detailPress() {
      if (onDetailPress != null) {
        onDetailPress!(song.id ?? '');
      }
    }

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: detailPress,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.artist ?? '',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
