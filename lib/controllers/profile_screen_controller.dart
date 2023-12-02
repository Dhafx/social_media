import 'package:appwrite/appwrite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'client_controller.dart';

class ProfileScreenController extends ClientController {
  RxString username = ''.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late final Databases? databases;

  @override
  void onInit() {
    super.onInit();
    databases = Databases(client);
  }

  @override
  void onReady() {
    getUserDoc();
    super.onReady();
  }

  Future<void> getUserDoc() async {
    final result = await databases?.getDocument(
      databaseId: '656b24974b4a6cff4e90',
      collectionId: '656b24a91476f8a421d7',
      documentId: firebaseAuth.currentUser!.uid,
    );
    username.value = result?.data['username'];
  }
}
