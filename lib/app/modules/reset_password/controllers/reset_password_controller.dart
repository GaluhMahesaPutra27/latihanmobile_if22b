import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  //TODO: Implement ResetPasswordController
  final cEmail = TextEditingController();

  final count = 0.obs;
  @override
  void onClose() {
    cEmail.dispose();
    super.onClose();
  }
}