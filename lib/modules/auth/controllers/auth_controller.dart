import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/secure_storage_service.dart';

class AuthController extends GetxController {
  final _secureStorage = Get.find<SecureStorageService>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      
      // Mock network delay
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Mock session saving
      await _secureStorage.saveAuthToken('mock_jwt_token_123456');
      await _secureStorage.saveRefreshToken('mock_refresh_token_654321');
      await _secureStorage.saveUserSession('{"name": "Developer", "email": "${emailController.text}"}');
      
      isLoading.value = false;
      
      // Navigate to Home
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
