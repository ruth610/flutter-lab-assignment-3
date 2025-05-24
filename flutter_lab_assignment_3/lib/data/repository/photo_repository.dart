import 'dart:convert';
import 'dart:io';

import '../models/photo.dart';

class PhotoRepository {
  final HttpClient _httpClient = HttpClient();

  Future<List<Photo>> fetchPhotos(int albumId) async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/$albumId/photos');
      final request = await _httpClient.getUrl(url);
      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final List<dynamic> jsonList = json.decode(responseBody);
        return jsonList.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('PhotoRepository Error: $e');
    }
  }
}
