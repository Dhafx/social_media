import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'controllers/auth_controller.dart';
// import 'controllers/firebase_messaging_handler.dart';
import 'screens/sign_in_screen.dart';
import 'widgets/bottom_navbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseMessagingHandler().initPushNotification();
  // await FirebaseMessagingHandler().initLocalNotification();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social Media',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'PlusJakartaSans',
      ),
      debugShowCheckedModeBanner: false,
      home: authController.firebaseAuth.currentUser != null
          ? const BottomNavbar()
          : const SignInScreen(),
    );
  }
}
