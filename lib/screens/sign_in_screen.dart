import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/form_text_field.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7737FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Social Media',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 64),
                const Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 32),
                FormTextField(
                  type: 'text',
                  fieldController: authController.emailController,
                  fieldLabelText: 'Email',
                ),
                const SizedBox(height: 16),
                FormTextField(
                  type: 'password',
                  fieldController: authController.passwordController,
                  fieldLabelText: 'Password',
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF7737FF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return authController.isLoading.value
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Color(0xFF7737FF),
                            strokeWidth: 2,
                          ),
                        )
                      : const SizedBox();
                }),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    authController.signIn();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF7737FF),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    authController.continueWithGoogle();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(
                        width: 1,
                        color: const Color(0x40000000),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/google.png',
                          width: 16,
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Does not have an account? '),
                    GestureDetector(
                      onTap: () {
                        Get.to(() {
                          return const SignUpScreen();
                        });
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
