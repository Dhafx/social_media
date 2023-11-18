import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/followers_screen_controller.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  final FollowersScreenController followersScreenController =
      Get.put(FollowersScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          itemCount: followersScreenController.followers.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: index == 0
                    ? const EdgeInsets.only(top: 16)
                    : index == followersScreenController.followers.length - 1
                        ? const EdgeInsets.only(bottom: 16)
                        : null,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
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
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0xFFFFFFFF),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(followersScreenController
                              .followers[index].profilePicUrl),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: followersScreenController
                                          .followers[index].isVerified ==
                                      true
                                  ? const EdgeInsets.only(right: 8)
                                  : null,
                              child: Text(
                                followersScreenController
                                    .followers[index].username,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            followersScreenController
                                    .followers[index].isVerified
                                ? const Icon(
                                    CupertinoIcons.checkmark_seal_fill,
                                    color: Colors.blue,
                                    size: 16,
                                  )
                                : Container(),
                          ],
                        ),
                        followersScreenController.followers[index].fullName !=
                                ''
                            ? Text(
                                followersScreenController
                                    .followers[index].fullName,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
