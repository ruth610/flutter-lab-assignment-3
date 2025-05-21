import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../business/bloc/album_bloc.dart';
import '../../business/bloc/album_state.dart';
import '../widgets/album_tile.dart';

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50], // light purple background
      appBar: AppBar(
        title: const Text('Albums'),
        backgroundColor: Colors.deepPurple, // app bar color
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                return AlbumTile(
                  title: album.title,
                  onTap: () {
                    context.push('/details', extra: album.id);
                  },
                );
              },
            );
          } else if (state is AlbumError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
