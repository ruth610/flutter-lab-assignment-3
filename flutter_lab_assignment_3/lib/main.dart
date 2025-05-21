import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './data/repository/album_repository.dart';
import './business/bloc/album_bloc.dart';
import './business/bloc/album_event.dart';
import './router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AlbumRepository(),
      child: BlocProvider(
        create: (context) => AlbumBloc(context.read<AlbumRepository>())..add(FetchAlbums()),
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
