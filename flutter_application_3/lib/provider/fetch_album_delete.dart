import 'dart:convert';
import 'package:flutter_application_3/utils/album.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum2() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/100'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album!');
  }
}

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Deleted.');
  }
}
