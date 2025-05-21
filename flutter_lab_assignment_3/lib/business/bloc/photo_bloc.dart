import 'package:flutter_bloc/flutter_bloc.dart';
import 'photo_event.dart';
import 'photo_state.dart';
import '../../data/repository/photo_repository.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository repository;

  PhotoBloc(this.repository) : super(PhotoInitial()) {
    on<FetchPhotos>((event, emit) async {
      emit(PhotoLoading());
      try {
        final photos = await repository.fetchPhotos(event.albumId);
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(PhotoError(e.toString()));
      }
    });
  }
}
