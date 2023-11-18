import 'package:flutter/material.dart';

class UserBookmarks extends StatefulWidget {
  const UserBookmarks({super.key});

  @override
  State<UserBookmarks> createState() => _UserBookmarksState();
}

class _UserBookmarksState extends State<UserBookmarks> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bookmark'),
    );
  }
}
