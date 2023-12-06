import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_controller.dart';
import 'database_controller.dart';

class ProfileScreenController extends FirebaseController {
  final DatabaseController databaseController = Get.put(DatabaseController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final RxString profilePictureUrl = ''.obs;
  final RxString username = ''.obs;
  final RxString bio = ''.obs;
  final RxList<dynamic> followers = [].obs;
  final RxList<dynamic> following = [].obs;
  final RxList<dynamic> posts = [].obs;

  @override
  void onInit() {
    super.onInit();
    setUserData();
  }

  void setUserData() async {
    final result = await databaseController
        .getUserDocument('${firebaseAuth.currentUser?.uid}');
    profilePictureUrl.value = result['profilePictureUrl'] ?? '';
    username.value = result['username'] ?? '';
    bio.value = result['bio'] ?? '';
    followers.assignAll(result['followers'] ?? []);
    following.assignAll(result['following'] ?? []);
    posts.assignAll(result['posts'] ?? []);
  }

  void updateUserData() {
    databaseController.updateUserDocument('${firebaseAuth.currentUser?.uid}', {
      'username': usernameController.text,
      'bio': bioController.text,
    });
  }
}
