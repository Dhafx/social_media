import 'package:flutter/material.dart';

import '../widgets/home_screen_header.dart';
import '../widgets/story.dart';
import '../widgets/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const HomeScreenHeader(),
              Container(
                height: 113,
                padding: const EdgeInsets.only(bottom: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0x26000000),
                    ),
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Story(key: ObjectKey(index), index: index);
                  },
                ),
              ),
              const Post(),
              const Post(),
              const Post(),
            ],
          ),
        ),
      ),
    );
  }
}
