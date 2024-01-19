import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/fetch_album.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/album.dart';

class AlbumActivite extends StatefulWidget {
  const AlbumActivite({super.key});

  @override
  State<AlbumActivite> createState() => _AlbumActivite();
}

class _AlbumActivite extends State<AlbumActivite> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leading: IconButton(
              onPressed: () {
                context.go('/animated');
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Fetch Data Example'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
