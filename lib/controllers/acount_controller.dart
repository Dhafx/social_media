import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appwrite_controller.dart';

class AccountController extends AppwriteController {
  Future createAccount(
    String userId,
    String email,
    String password,
    String name,
  ) async {
    try {
      await account.create(
        userId: userId,
        email: email,
        password: password,
        name: name,
      );
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Appwrite Create Account Error',
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

  Future createEmailSession(String email, String password) async {
    try {
      await account.createEmailSession(
        email: email,
        password: password,
      );
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Appwrite Crete Email Session Error',
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
}
