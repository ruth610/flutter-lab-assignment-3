import 'dart:convert';
import 'dart:io';

import '../models/album.dart';
import '../models/photo.dart';

class AlbumRepository {
  final HttpClient _httpClient = HttpClient();
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<Album>> fetchAlbums() async {
    final url = Uri.parse("${_baseUrl}albums");
    final request = await _httpClient.getUrl(url);
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      final List<dynamic> jsonList = json.decode(responseBody);
      return jsonList.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load albums");
    }
  }

  Future<List<Photo>> fetchPhotos(int albumId) async {
    final url = Uri.parse("${_baseUrl}photos?albumId=$albumId");
    final request = await _httpClient.getUrl(url);
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      final List<dynamic> jsonList = json.decode(responseBody);
      return jsonList.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load photos");
    }
  }
}
