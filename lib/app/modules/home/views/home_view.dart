// Suggested code may be subject to a license. Learn more: ~LicenseLog:22676838.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4229525960.
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
   HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
             cAuth.logout();
          },
         child: const Text(
            'Logout',
          style: TextStyle(fontSize: 20),
        ),
        )
      ),
    );
  }
}
