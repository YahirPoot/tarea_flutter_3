import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/fetch_album.dart';
import '../../../../utils/album.dart';

class AlbumActivite2 extends StatefulWidget {
  const AlbumActivite2({super.key});

  @override
  State<AlbumActivite2> createState() => _AlbumActivite2();
}

class _AlbumActivite2 extends State<AlbumActivite2> {
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
          title: const Text('Fetch Data Example'),
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
