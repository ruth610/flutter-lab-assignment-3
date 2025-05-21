abstract class AlbumEvent {}

class FetchAlbums extends AlbumEvent {}

class FetchPhotos extends AlbumEvent {
  final int albumId;
  FetchPhotos(this.albumId);
}
