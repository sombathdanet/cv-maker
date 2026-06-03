import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final currentLocale = Get.locale.obs;

  void changeLanguage(String langCode, String countryCode) {
    final locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
    currentLocale.value = locale;
  }
}
