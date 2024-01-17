import 'dart:convert';
import 'package:flutter_application_3/utils/album.dart';
import 'package:http/http.dart' as http;

Album album = const Album(id: 1, title: '');

Future<Album> fetchAlbum2() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album!');
  }
}

Future<Album> deleteAlbum(String string) async {
  final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/${album.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to delete Album.');
  }
}
