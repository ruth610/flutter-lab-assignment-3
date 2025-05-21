import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AlbumTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
