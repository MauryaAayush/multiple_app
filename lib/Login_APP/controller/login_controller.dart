
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      Get.snackbar('Success', 'Login Successful', backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value) || !value.endsWith('@gmail.com')) {
      return 'Invalid email. Must be a @gmail.com';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}
