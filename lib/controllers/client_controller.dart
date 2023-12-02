import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class ClientController extends GetxController {
  Client client = Client();

  @override
  void onInit() {
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "6565fd44a53325be066e";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
    super.onInit();
  }
}
