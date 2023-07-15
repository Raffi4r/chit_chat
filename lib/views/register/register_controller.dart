import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bcrypt/bcrypt.dart';

class RegisterController extends GetxController {
  var isPasswordHidden = true.obs;
  var isConfPasswordHidden = true.obs;

  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController.text = '';
    usernameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 6) {
      return 'Username must be at least 6 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailRegex);
    if (!regex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != passwordController.text) {
      return 'Password and confirm password do not match';
    }
    return null;
  }

  Future<void> lastCheck() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    isLoading.value = true;
    if (await isUsernameAlreadyExist(usernameController.text)) {
      Get.snackbar('Ups!', 'Username already taken');
      isLoading.value = false;
      return;
    }
    if (await isEmailAlreadyExist(emailController.text)) {
      Get.snackbar('Ups!', 'Email already registered');
      isLoading.value = false;
      return;
    }
    register();
  }

  Future<void> register() async {
    String nameValue = nameController.text;
    String usernameValue = usernameController.text;
    String emailValue = emailController.text;
    String passwordValue = passwordController.text;

    String encryptedPassword = hashPassword(passwordValue);

    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      final newDocRef = usersCollection.doc();

      // tambahkan dokumen ke Firestore
      await newDocRef.set({
        'name': nameValue,
        'username': usernameValue,
        'email': emailValue,
        'password': encryptedPassword,
      });
      isLoading.value = false;
      Get.dialog(
          AlertDialog(
            title: Text('Registration Successful'),
            content: Text('You have successfully registered'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('OK'),
              ),
            ],
          ),
          barrierDismissible: false);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Registration Failed',
          'The password provided is too weak',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isUsernameAlreadyExist(String username) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> isEmailAlreadyExist(String email) async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  String hashPassword(String password) {
    var salt = BCrypt.gensalt();
    var hashedPassword = BCrypt.hashpw(password, salt);
    return hashedPassword;
  }

  @override
  void onClose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
