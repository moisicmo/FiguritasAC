import 'package:FiguritasAC/bloc/album/album_bloc.dart';
import 'package:FiguritasAC/components/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColectionsPage extends StatefulWidget {
  const ColectionsPage({super.key});

  @override
  State<ColectionsPage> createState() => _ColectionsPageState();
}

class _ColectionsPageState extends State<ColectionsPage> {
  @override
  Widget build(BuildContext context) {
    final albumBloc = BlocProvider.of<AlbumBloc>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (albumBloc.state.existAlbum)
            for (final item in albumBloc.state.album!.data!.countries!) CountryCard(country: item, players: item.players!,
                colorRepeated: Colors.lightBlue,
              )
        ],
      ),
    );
  }
}
