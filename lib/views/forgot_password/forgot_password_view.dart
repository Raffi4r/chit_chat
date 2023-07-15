import 'package:chit_chat/views/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../materials/colors.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          title: Text('Reset Password',
              style: TextStyle(fontWeight: FontWeight.w800))),
      body: Stack(children: [
        Image.asset(
          'assets/images/background_image.jpg',
          height: Get.mediaQuery.size.height,
          width: Get.mediaQuery.size.width,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              Center(
                child:
                    Image.asset('assets/images/cc_logo_no_bg.png', width: 200),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Enter your email address to get a link to reset your password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 56,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
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
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: double.infinity,
                  height: 56,
                  padding:
                      EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'RESET PASSWORD',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(MyColors.primary),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                  )),
            ]),
          ),
        ),
      ]),
    );
  }
}
