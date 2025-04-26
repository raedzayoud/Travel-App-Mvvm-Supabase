
import 'package:flutter/material.dart';
import 'package:travel/feature/authentication/presentation/view/login_view.dart';
import 'package:travel/feature/authentication/presentation/view/register_view.dart';
import 'package:travel/feature/home/presentation/view/home.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> pageRoutes = {
    "register": (context) => const RegisterView(),
    "login": (context) => const LoginView(),
    "home":(context)=>const Home()
  };
}
