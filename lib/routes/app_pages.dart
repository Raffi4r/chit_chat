import 'package:chit_chat/routes/route_name.dart';
import 'package:chit_chat/views/forgot_password/forgot_password_binding.dart';
import 'package:chit_chat/views/home/home_binding.dart';
import 'package:chit_chat/views/home/home_view.dart';
import 'package:chit_chat/views/login/login_binding.dart';
import 'package:chit_chat/views/login/login_view.dart';
import 'package:chit_chat/views/register/register_view.dart';
import 'package:chit_chat/views/splash/splash_view.dart';
import 'package:get/get.dart';

import '../views/forgot_password/forgot_password_view.dart';
import '../views/register/register_binding.dart';
import '../views/splash/splash_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: RouteName.splash,
        page: () => SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: RouteName.home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: RouteName.login,
        page: () => LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: RouteName.register,
        page: () => RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: RouteName.forgotPassword,
        page: () => ForgotPasswordView(),
        binding: ForgotPasswordBinding())
  ];
}
