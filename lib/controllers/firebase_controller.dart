import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  late FirebaseAuth firebaseAuth;

  @override
  void onInit() {
    firebaseAuth = FirebaseAuth.instance;
    super.onInit();
  }
}
