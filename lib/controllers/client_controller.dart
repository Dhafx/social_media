import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class ClientController extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    const endPoint = "ENDPOINT_APPWRITE";
    const projectID = "PROJECT_APPWRITE";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);

    super.onInit();
  }
}
