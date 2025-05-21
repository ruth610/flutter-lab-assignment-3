import '../../data/models/album.dart';
import '../../data/models/photo.dart';

abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;
  AlbumLoaded(this.albums);
}

class PhotoLoaded extends AlbumState {
  final List<Photo> photos;
  PhotoLoaded(this.photos);
}

class AlbumError extends AlbumState {
  final String message;
  AlbumError(this.message);
}
