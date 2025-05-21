import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/bloc/photo_bloc.dart';
import '../../business/bloc/photo_event.dart';
import '../../business/bloc/photo_state.dart';
import '../../data/repository/photo_repository.dart';

class AlbumDetailScreen extends StatelessWidget {
  final int albumId;

  const AlbumDetailScreen({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotoBloc(PhotoRepository())..add(FetchPhotos(albumId)),
      child: Scaffold(
        body: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state is PhotoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PhotoLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 150.0,
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.deepPurple,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Album #$albumId'),
                      background: Container(color: Colors.purple[300]),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final photo = state.photos[index];
                        return ListTile(
                          leading: Image.network(
                            photo.workingThumbnail,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image),
                          ),
                          title: Text(photo.title),
                        );
                      },
                      childCount: state.photos.length,
                    ),
                  ),
                ],
              );
            } else if (state is PhotoError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
