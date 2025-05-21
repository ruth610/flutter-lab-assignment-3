import 'package:dio/dio.dart';
import '../models/photo.dart';

class PhotoRepository {
  final Dio _dio = Dio();

  Future<List<Photo>> fetchPhotos(int albumId) async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/albums/$albumId/photos',
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('PhotoRepository Error: $e');
    }
  }
}
