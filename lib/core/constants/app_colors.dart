import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1A365D); // Sidebar Dark Blue
  static const Color background = Color(0xFFF8F9FA); // Light background
  static const Color border = Color(0xFFE2E8F0); // Slate 200 border
  static const Color textDark = Color(0xFF1E293B); // Dark slate for body text
  static const Color textLight = Color(0xFF64748B); // Muted slate text
  
  // Design Swatches from Vue Accent Picker
  static const List<String> accentHexes = [
    '#1a1a2e',
    '#16213e',
    '#0f3460',
    '#e94560',
    '#2b2d42',
    '#457b9d',
    '#2d6a4f',
    '#b5838d'
  ];

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
