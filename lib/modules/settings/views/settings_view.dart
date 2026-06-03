import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textDark,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            color: Colors.white,
            elevation: 0.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  title: const Text('English (UK)'),
                  trailing: const Text('🇬🇧', style: TextStyle(fontSize: 20)),
                  onTap: () => controller.changeLanguage('en', 'US'),
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('ភាសាខ្មែរ (Khmer)'),
                  trailing: const Text('🇰🇭', style: TextStyle(fontSize: 20)),
                  onTap: () => controller.changeLanguage('km', 'KH'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
