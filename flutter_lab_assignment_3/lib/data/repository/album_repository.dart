import 'package:dio/dio.dart';
import '../api/retrofit_client.dart';
import '../models/album.dart';
import '../models/photo.dart';

class AlbumRepository {
  final Dio dio = RetrofitClient().dio;

  Future<List<Album>> fetchAlbums() async {
    final response = await dio.get("albums");
    return (response.data as List).map((json) => Album.fromJson(json)).toList();
  }

  Future<List<Photo>> fetchPhotos(int albumId) async {
    final response = await dio.get("photos", queryParameters: {"albumId": albumId});
    return (response.data as List).map((json) => Photo.fromJson(json)).toList();
  }
}
