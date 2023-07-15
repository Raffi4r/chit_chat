import 'package:bcrypt/bcrypt.dart';
import 'package:chit_chat/routes/route_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailOrUsernameController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailOrUsernameController.text = '';
    passwordController.text = '';
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter email or username';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter password';
    }
    return null;
  }

  void signInWithEmail() async {
    final userRef = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailOrUsernameController.text)
        .get();

    validation(userRef);
  }

  void signInWithUsername() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final userRef = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: emailOrUsernameController.text)
        .get();

    validation(userRef);
  }

  Future<void> validation(QuerySnapshot<Map<String, dynamic>> userRef) async {
    print(userRef);
    if (userRef.docs.isEmpty) {
      Get.snackbar('Login Failed', 'Email or username not registered');
    } else {
      final user = userRef.docs.first;
      final userData = user.data();

      final isPasswordValid =
          await BCrypt.checkpw(passwordController.text, userData['password']);

      if (isPasswordValid) {
        Get.offNamed(RouteName.home);
        isLoading.value = false;
        Get.snackbar('Welcome', userData['name']);
      } else {
        Get.snackbar('Login Failed', 'Wrong Password');
      }
    }
  }

  @override
  void onClose() {
    emailOrUsernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
