import 'package:FiguritasAC/models/album_model.dart';
import 'package:flutter/material.dart';

class ItemCardRounded extends StatelessWidget {
  final Player player;
  final Color color;
  final Color colorRepeated;

  const ItemCardRounded({
    Key? key,
    required this.player,
    required this.color, required this.colorRepeated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: player.status! ? color : Colors.grey[300], borderRadius: const BorderRadius.all(Radius.circular(100))),
            child: Center(
                child: Text(
              player.namePlayer!,
              style: const TextStyle(color: Colors.white),
            )),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      color: colorRepeated,
                      borderRadius: const BorderRadius.all(Radius.circular(100))),
                  child: player.duplicates !=0?Center(
                      child: Text(
                    '${player.duplicates}',
                    style: const TextStyle(color: Colors.white),
                  )):null)),
        ],
      ),
    );
  }
}
