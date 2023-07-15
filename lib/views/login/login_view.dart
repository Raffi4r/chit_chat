import 'package:chit_chat/materials/colors.dart';
import 'package:chit_chat/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/background_image.jpg',
        height: Get.mediaQuery.size.height,
        width: Get.mediaQuery.size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: controller.formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Center(
                    child: Image.asset('assets/images/cc_logo_no_bg.png',
                        width: 200),
                  ),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: MyColors.secondary,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email / Username',
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: MyColors.secondary,
                      ),
                    ),
                  ),
                  controller: controller.emailOrUsernameController,
                  validator: controller.validateEmail,
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(() {
                  return TextFormField(
                    obscureText: controller.isPasswordHidden.value,
                    textInputAction: TextInputAction.done,
                    cursorColor: MyColors.secondary,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                      ),
                      suffixIcon: Obx(() {
                        return IconButton(
                          icon: Icon(controller.isPasswordHidden == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            controller.isPasswordHidden.value =
                                !controller.isPasswordHidden.value;
                          },
                          splashRadius: 10,
                        );
                      }),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: MyColors.secondary,
                        ),
                      ),
                    ),
                    controller: controller.passwordController,
                    validator: controller.validatePassword,
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    height: 56,
                    padding: EdgeInsets.only(
                        bottom: Get.mediaQuery.viewInsets.bottom),
                    child: Obx(() {
                      return ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                                if (controller.emailOrUsernameController.text
                                    .trim()
                                    .contains('@')) {
                                  controller.signInWithEmail();
                                } else {
                                  controller.signInWithUsername();
                                }
                              },
                        child: controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Text(
                                'SIGN IN',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyColors.primary),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                      );
                    })),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () => Get.toNamed(RouteName.forgotPassword),
                    child: Text('Forgot your password?',
                        style: TextStyle(fontWeight: FontWeight.w800))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('Don\'t have an account?',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () => Get.toNamed(RouteName.register),
                        child: Text('SIGN UP',
                            style: TextStyle(fontWeight: FontWeight.w800)))
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    ]);
  }
}
