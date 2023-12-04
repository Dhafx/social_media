import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

import '../constants/appwrite.dart';

class AppwriteController extends GetxController {
  late Client client;
  late Account account;
  late Databases databases;
  late Storage storage;
  late Realtime realtime;

  @override
  void onInit() {
    client = Client()
        .setEndpoint(APPWRITE_END_POINT)
        .setProject(APPWRITE_PROJECT_ID)
        .setSelfSigned(status: true);
    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
    realtime = Realtime(client);
    super.onInit();
  }
}
