import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';
import '../../data/repository/album_repository.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc(this.repository) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repository.fetchAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError("Failed to load albums"));
      }
    });

    on<FetchPhotos>((event, emit) async {
      emit(AlbumLoading());
      try {
        final photos = await repository.fetchPhotos(event.albumId);
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(AlbumError("Failed to load photos"));
      }
    });
  }
}
