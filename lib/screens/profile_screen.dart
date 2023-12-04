import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_media/screens/edit_profile_screen.dart';

import '../controllers/auth_controller.dart';
import '../controllers/profile_screen_controller.dart';
import 'follow_screen.dart';
import '../widgets/story.dart';
import '../widgets/user_posts.dart';
import '../widgets/user_bookmarks.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController authController = Get.put(AuthController());
  final ProfileScreenController profileScreenController =
      Get.put(ProfileScreenController());

  final List<String> imgUrl = [
    'https://images.pexels.com/photos/15745221/pexels-photo-15745221/free-photo-of-fog-over-water.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18057909/pexels-photo-18057909/free-photo-of-three-parakeets-perching-on-a-branch.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18278182/pexels-photo-18278182/free-photo-of-sunlight-on-fern-shrub.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/14054419/pexels-photo-14054419.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18103235/pexels-photo-18103235/free-photo-of-a-bull-beside-a-road-sign.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/18103235/pexels-photo-18103235/free-photo-of-a-bull-beside-a-road-sign.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  ];

  final List<Widget> tabBarView = const [
    UserPosts(),
    UserBookmarks(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: const Icon(CupertinoIcons.add_circled),
                    ),
                    GestureDetector(
                      onTap: () {
                        authController.signOut();
                      },
                      child: const Icon(CupertinoIcons.line_horizontal_3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.to(() {
                        return const FollowScreen(index: 0);
                      });
                    },
                    child: Column(
                      children: [
                        Obx(() {
                          return Text(
                            '${profileScreenController.followers.length}',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }),
                        const Text('followers'),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xFF9B2282),
                          Color(0xFFEEA863),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: profileScreenController.profilePictureUrl.value != ''
                        ? Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/1727273/pexels-photo-1727273.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          )
                        : Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/blank-profile.png'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() {
                        return const FollowScreen(index: 1);
                      });
                    },
                    child: Column(
                      children: [
                        Obx(() {
                          return Text(
                            '${profileScreenController.following.length}',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }),
                        const Text('following'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: <Widget>[
                  Obx(() {
                    return Text(
                      profileScreenController.username.value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }),
                  Obx(() {
                    return profileScreenController.bio.value != ''
                        ? Text(
                            profileScreenController.bio.value,
                          )
                        : const SizedBox();
                  }),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.to(() {
                        return const EditProfileScreen();
                      });
                    },
                    child: Container(
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFFEFEFEF),
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    child: Container(
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFFEFEFEF),
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Share Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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
                    return Story(index: index);
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0x26000000),
                    ),
                  ),
                ),
                child: const TabBar(
                  tabs: [
                    Tab(icon: Icon(CupertinoIcons.photo_on_rectangle)),
                    Tab(icon: Icon(CupertinoIcons.bookmark)),
                  ],
                ),
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
