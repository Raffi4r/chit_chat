import 'package:chit_chat/views/splash/splash_controller.dart';
import 'package:chit_chat/materials/colors.dart';
import 'package:chit_chat/routes/app_pages.dart';
import 'package:chit_chat/views/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ChitChat());
}

class ChitChat extends StatelessWidget {
  const ChitChat({super.key});

  @override
  Widget build(BuildContext context) {
    final splashC = Get.put(SplashController());
    return GetMaterialApp(
      scrollBehavior:  MyCustomScrollBehavior(),
      home: SplashView(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      theme: ThemeData(
        primaryColor: MyColors.primary,
        textTheme: GoogleFonts.quicksandTextTheme(Get.theme.textTheme),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: MyColors.secondary,
            ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
