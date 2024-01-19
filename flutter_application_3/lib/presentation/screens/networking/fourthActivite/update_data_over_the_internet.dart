import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/fetch_album.dart';
import 'package:flutter_application_3/utils/album.dart';
import 'package:go_router/go_router.dart';

class UpdateDataOverInternet extends StatefulWidget {
  const UpdateDataOverInternet({super.key});

  @override
  State<UpdateDataOverInternet> createState() {
    return _UpdateDataOverInternet();
  }
}

class _UpdateDataOverInternet extends State<UpdateDataOverInternet> {
  final TextEditingController _controller = TextEditingController();
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Update Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          actions: [
            IconButton(
                onPressed: () {
                  context.go('/animated');
                },
                icon: const Icon(Icons.arrow_back))
          ],
          title: const Text('Update Data Example'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data!.title),
                      TextField(
                        controller: _controller,
                        decoration:
                            const InputDecoration(hintText: 'Enter Title'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _futureAlbum = updateAlbum(_controller.text);
                            });
                          },
                          child: const Text('Update Data')),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
