import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/fetch_album.dart';
import 'package:flutter_application_3/provider/fetch_album_delete.dart';
// import 'package:flutter_application_3/provider/fetch_album_delete.dart';
import 'package:flutter_application_3/utils/album.dart';

class DeleteDataInternet extends StatefulWidget {
  const DeleteDataInternet({super.key});
  @override
  State<DeleteDataInternet> createState() {
    return _DeleteDataInternet();
  }
}

class _DeleteDataInternet extends State<DeleteDataInternet> {
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
      title: 'Delete Data Example',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Delete Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data?.title ?? 'Deleted'),
                      ElevatedButton(
                        child: const Text('Delete Data'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum =
                                deleteAlbum(snapshot.data!.id.toString());
                          });
                        },
                      )
                    ],
                  );
                }
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
