import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_controller.dart';
import 'database_controller.dart';
import '../screens/sign_in_screen.dart';
import '../widgets/bottom_navbar.dart';

class AuthController extends FirebaseController {
  final DatabaseController databaseController = Get.put(DatabaseController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAll(() {
          return const SignInScreen();
        });
      }
    });
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clearValues() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> signUp() async {
    try {
      isLoading.value = true;
      await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (firebaseAuth.currentUser?.uid != null) {
        databaseController.createUserDcoment(
          '${firebaseAuth.currentUser?.uid}',
          usernameController.text,
        );
        clearValues();
        Get.offAll(() {
          return const BottomNavbar();
        });
      }
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Firebase Sign Up Error',
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    try {
      isLoading.value = true;
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (firebaseAuth.currentUser != null) {
        clearValues();
        Get.offAll(() {
          return const BottomNavbar();
        });
      }
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Firebase Sign In Error',
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> continueWithGoogle() async {
    try {} catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Firebase Continue With Google Error',
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

  Future<void> signOut() async {
    try {
      firebaseAuth.signOut();
    } catch (error) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(16),
        title: 'Firebase Sign Out Error',
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
