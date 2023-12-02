import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

import 'client_controller.dart';

class AccountController extends ClientController {
  late final Account? account;

  @override
  void onInit() {
    super.onInit();
    account = Account(client);
  }

  Future createAccount(Map map) async {
    try {
      await account?.create(
        userId: map['userId'],
        email: map['email'],
        password: map['password'],
        name: map['name'],
      );
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Error',
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFF6161),
        ),
        middleText: 'Something went wrong.',
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

  Future createEmailSession(Map map) async {
    try {
      await account?.createEmailSession(
        email: map['email'],
        password: map['password'],
      );
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Error',
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFF6161),
        ),
        middleText: 'Something went wrong.',
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
