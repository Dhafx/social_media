import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/sign_in_screen.dart';
import '../widgets/bottom_navbar.dart';

//inisiasi 4 variabel terakhir, username, email, pw, state isLoading,
class AuthController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool isLoading = false.obs;

  //kalo value usernya masih kosong, dia bakal ngereturn SignInScreen dengan penggunaan authStateChanges dengan inisiasi objek user
  @override
  void onInit() {
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAll(() {
          return const SignInScreen();
        });
      }
    });
    super.onInit();
  }

  //text editing controller yg fungsinya mirip dengan clearing function
  //untuk memberhentikan dan membersihkan sumber daya yang digunakan masing-masing 
  //controller variabel
  @override
  void onClose() {//adalah metode yang dioverride dari superclass StateNotifier. Metode ini dipanggil ketika widget terkait dihapus dari pohon widget.
    username.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void clearValues() {
    username.clear();
    email.clear();
    password.clear();
  }

  // Fungsi untuk melakukan registrasi user baru
  Future<void> signUp() async {
    try {
      isLoading.value = true; // Set status loading menjadi true
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      if (firebaseAuth.currentUser != null) {
        clearValues(); // Membersihkan nilai controller jika registrasi berhasil
        Get.offAll(() {
          return const BottomNavbar(); // Redirect ke halaman Bottom Navbar
        });
      }
    } catch (error) {
      // Menangani error dengan menampilkan dialog
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
    } finally {
      isLoading.value = false; // Set status loading menjadi false setelah selesai
    }
  }

  // Fungsi untuk melakukan login
  Future<void> signIn() async {
    try {
      isLoading.value = true; // Set status loading menjadi true
      await firebaseAuth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (firebaseAuth.currentUser != null) {
        clearValues(); // Membersihkan nilai controller jika login berhasil
        Get.offAll(() {
          return const BottomNavbar(); // Redirect ke halaman Bottom Navbar
        });
      }
    } catch (error) {
      // Menangani error dengan menampilkan dialog
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
    } finally {
      isLoading.value = false; // Set status loading menjadi false setelah selesai
    }
  }

  // Fungsi untuk melanjutkan otentikasi dengan Google (belum diimplementasikan)
  Future<void> continueWithGoogle() async {
    try {
      // Fungsi belum diimplementasikan
    } catch (error) {
      // Menangani error dengan menampilkan dialog
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
4          TextButton(
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

  // Fungsi untuk logout
  Future<void> signOut() async {
    try {
      firebaseAuth.signOut(); // Melakukan logout
    } catch (error) {
      // Menangani error dengan menampilkan dialog
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