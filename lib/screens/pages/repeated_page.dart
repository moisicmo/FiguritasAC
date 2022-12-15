import 'package:FiguritasAC/bloc/album/album_bloc.dart';
import 'package:FiguritasAC/components/country_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepeatedPage extends StatefulWidget {
  const RepeatedPage({super.key});

  @override
  State<RepeatedPage> createState() => _RepeatedPageState();
}

class _RepeatedPageState extends State<RepeatedPage> {
  @override
  Widget build(BuildContext context) {
    final albumBloc = BlocProvider.of<AlbumBloc>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (albumBloc.state.existAlbum)
            for (final item in albumBloc.state.album!.data!.countries!)
              CountryCard(
                country: item,
                players: item.players!.where((e) => e.duplicates != 0).toList(),
                colorRepeated: Colors.red,
              )
        ],
      ),
    );
  }
}
