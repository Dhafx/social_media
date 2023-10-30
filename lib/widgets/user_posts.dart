import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({super.key});

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  final List<String> imgUrl = [
    'https://images.pexels.com/photos/15745221/pexels-photo-15745221/free-photo-of-fog-over-water.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18057909/pexels-photo-18057909/free-photo-of-three-parakeets-perching-on-a-branch.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18278182/pexels-photo-18278182/free-photo-of-sunlight-on-fern-shrub.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/14054419/pexels-photo-14054419.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18103235/pexels-photo-18103235/free-photo-of-a-bull-beside-a-road-sign.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18103235/pexels-photo-18103235/free-photo-of-a-bull-beside-a-road-sign.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: MasonryGridView.builder(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: imgUrl.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) => ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(imgUrl[index]),
        ),
      ),
    );
  }
}
