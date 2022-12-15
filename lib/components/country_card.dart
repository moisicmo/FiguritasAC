import 'package:FiguritasAC/models/album_model.dart';
import 'package:FiguritasAC/components/item_card.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final List<Player> players;
  final Color colorRepeated;
  const CountryCard({
    Key? key,
    required this.country,
    required this.players,
    required this.colorRepeated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (players.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(country.nameCountry!),
          ),
        ListView(physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, children: <Widget>[
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 8,
            children: List.generate(players.length, (index) {
              return ItemCardRounded(
                player: players[index],
                color: Color(int.parse("0xff${country.logoCountry!.replaceAll("#", "")}")),
                colorRepeated: colorRepeated,
              );
            }),
          ),
        ])
      ],
    );
  }
}
