import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'followers_screen.dart';
import 'following_screen.dart';

class FollowScreen extends StatefulWidget {
  final int index;

  const FollowScreen({
    super.key,
    required this.index,
  });

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  final List<Widget> tabBarView = const [
    FollowersScreen(),
    FollowingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.index,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 32),
                        child: const Icon(CupertinoIcons.arrow_left),
                      ),
                    ),
                    const Text(
                      'username',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const TabBar(
                tabs: [
                  Tab(text: 'Followers'),
                  Tab(text: 'Following'),
                ],
              ),
              Expanded(
                child: TabBarView(children: tabBarView),
              )
            ],
          ),
        ),
      ),
    );
  }
}
