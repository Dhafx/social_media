import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

import 'client_controller.dart';

class DatabaseController extends ClientController {
  late final Databases? databases;

  @override
  void onInit() {
    super.onInit();
    databases = Databases(client);
  }

  Future storeUserName(String userId, Map map) async {
    try {
      final result = await databases?.createDocument(
        databaseId: "656b24974b4a6cff4e90",
        documentId: userId,
        collectionId: "656b24a91476f8a421d7",
        data: map,
      );
      print("DatabaseController:: storeUserName $databases");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }
}
