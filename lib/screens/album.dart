import 'dart:convert';

import 'package:FiguritasAC/bloc/album/album_bloc.dart';
import 'package:FiguritasAC/models/album_model.dart';
import 'package:FiguritasAC/screens/pages/colections_page.dart';
import 'package:FiguritasAC/screens/pages/repeated_page.dart';
import 'package:FiguritasAC/screens/pages/search_page.dart';
import 'package:FiguritasAC/services/method.dart';
import 'package:FiguritasAC/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    getInfo();
  }

  getInfo() async {
    final albumBloc = BlocProvider.of<AlbumBloc>(context, listen: false);
    if (!mounted) return;
    Map<String, dynamic> data = {"auth_token": dotenv.env['PRIVATE_TOKEN'], "private_token": dotenv.env['AUTH_TOKEN']};
    final response = await serviceMethod(context, 'post', data, getAllFigurines());
    if (response != null) {
      albumBloc.add(UpdateAlbum(albumModelFromJson(json.encode(response.data))));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('¡Completa tu album!', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          TabBar(
            indicatorWeight: 5,
            indicatorColor: Colors.yellow,
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                child: Text('MI COLECCION'),
              ),
              Tab(
                child: Text('MIS REPETIDAS'),
              ),
              Tab(
                child: Text('BUSCAR'),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [ColectionsPage(), RepeatedPage(), SearchPage()],
            ),
          ),
        ],
      ),
    );
  }
}
