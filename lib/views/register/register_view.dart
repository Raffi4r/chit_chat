import 'package:chit_chat/views/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../materials/colors.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          title:
              Text('Sign Up', style: TextStyle(fontWeight: FontWeight.w800))),
      body: Stack(children: [
        Image.asset(
          'assets/images/background_image.jpg',
          height: Get.mediaQuery.size.height,
          width: Get.mediaQuery.size.width,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              child: Column(children: [
                Center(
                  child: Image.asset('assets/images/cc_logo_no_bg.png',
                      width: 200),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  cursorColor: MyColors.secondary,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Name',
                    prefixIcon: Icon(
                      Icons.edit_outlined,
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
                  controller: controller.nameController,
                  validator: controller.validateName,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  cursorColor: MyColors.secondary,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Username',
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
                  controller: controller.usernameController,
                  validator: controller.validateUsername,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: MyColors.secondary,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email address',
                    prefixIcon: Icon(
                      Icons.email_outlined,
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
                  controller: controller.emailController,
                  validator: controller.validateEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return TextFormField(
                    obscureText: controller.isPasswordHidden.value,
                    textInputAction: TextInputAction.next,
                    cursorColor: MyColors.secondary,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
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
                  height: 20,
                ),
                Obx(() {
                  return TextFormField(
                    obscureText: controller.isConfPasswordHidden.value,
                    textInputAction: TextInputAction.done,
                    cursorColor: MyColors.secondary,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                      ),
                      suffixIcon: Obx(() {
                        return IconButton(
                          icon: Icon(controller.isConfPasswordHidden == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            controller.isConfPasswordHidden.value =
                                !controller.isConfPasswordHidden.value;
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
                    controller: controller.confirmPasswordController,
                    validator: controller.validateConfirmPassword,
                  );
                }),
                const SizedBox(
                  height: 20,
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
                            : () => controller.lastCheck(),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Text(
                                'SIGN UP',
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text('Already have an account?',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () => Get.back(),
                        child: Text('SIGN IN',
                            style: TextStyle(fontWeight: FontWeight.w800)))
                  ],
                )
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
