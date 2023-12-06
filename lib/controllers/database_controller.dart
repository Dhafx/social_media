import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/constants/appwrite.dart';

import 'appwrite_controller.dart';

class DatabaseController extends AppwriteController {
  Future<void> createUserDcoment(String userUid, String username) async {
    try {
      await databases.createDocument(
        databaseId: APPWRITE_DATABASE_ID,
        documentId: userUid,
        collectionId: APPWRITE_DATABASE_USER_COLLECTION_ID,
        data: {
          'profilePictureUrl': '',
          'username': username,
          'bio': '',
        },
      );
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Appwrite Create User Document Error',
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFF6161),
        ),
        middleText: '$error',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                color: Color(0xFF7737FF),
              ),
            ),
          ),
        ],
      );
    }
  }

  Future<Map<String, dynamic>> getUserDocument(String userUid) async {
    try {
      final result = await databases.getDocument(
        databaseId: APPWRITE_DATABASE_ID,
        collectionId: APPWRITE_DATABASE_USER_COLLECTION_ID,
        documentId: userUid,
      );
      return result.data;
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Appwrite Get User Document Error',
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFF6161),
        ),
        middleText: '$error',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                color: Color(0xFF7737FF),
              ),
            ),
          ),
        ],
      );
    }

    return {};
  }

  Future<Map<String, dynamic>> updateUserDocument(
    String userUid,
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await databases.updateDocument(
        databaseId: APPWRITE_DATABASE_ID,
        collectionId: APPWRITE_DATABASE_USER_COLLECTION_ID,
        documentId: userUid,
        data: data,
      );
      return result.data;
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Appwrite Update User Document Error',
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFF6161),
        ),
        middleText: '$error',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Ok',
              style: TextStyle(
                color: Color(0xFF7737FF),
              ),
            ),
          ),
        ],
      );
    }

    return {};
  }
}
