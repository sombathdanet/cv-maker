import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../../core/constants/app_colors.dart';

class DesignTabWidget extends GetView<HomeController> {
  const DesignTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Title Section
          const Text(
            'Choose a Template',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Select a professional template for your resume',
            style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 24),

          // 2. Template Grid
          _buildTemplateGrid(),
          const SizedBox(height: 32),

          // 3. Color Picker Section
          _buildColorSection(),
          const SizedBox(height: 32),

          // 4. Font Picker Section
          _buildFontSection(),
        ],
      ),
    );
  }

  Widget _buildTemplateGrid() {
    final templates = [
      {
        'id': 'classic',
        'name': 'Classic',
        'desc': 'Traditional single-column layout with serif fonts',
      },
      {
        'id': 'modern',
        'name': 'Modern',
        'desc': 'Two-column layout with sidebar and accent colors',
      },
      {
        'id': 'minimal',
        'name': 'Minimal',
        'desc': 'Clean lines with lots of whitespace',
      },
    ];

    return Obx(() {
      final selected = controller.designState.value.template;
      return LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = constraints.maxWidth > 500 ? 3 : 2;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.65,
            ),
            itemCount: templates.length,
            itemBuilder: (context, idx) {
              final tpl = templates[idx];
              final isSelected = selected == tpl['id'];
              return GestureDetector(
                onTap: () => controller.updateTemplate(tpl['id']!),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.blue : const Color(0xFFE5E7EB),
                      width: 2,
                    ),
                    boxShadow: isSelected
                        ? [BoxShadow(color: Colors.blue.withOpacity(0.15), blurRadius: 12, offset: const Offset(0, 4))]
                        : [],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Mini-preview Thumbnail Box
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: _buildThumbnailPreview(tpl['id']!),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Info
                          Text(
                            tpl['name']!,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tpl['desc']!,
                            style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      if (isSelected)
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.check, size: 10, color: Colors.white),
                                SizedBox(width: 2),
                                Text('Selected', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }

  Widget _buildThumbnailPreview(String templateId) {
    if (templateId == 'modern') {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Sidebar mock
          Container(
            width: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF1A365D),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 6, width: 28, color: Colors.grey[300]),
                const SizedBox(height: 4),
                Container(height: 4, width: double.infinity, color: Colors.grey[200]),
                const SizedBox(height: 4),
                Container(height: 4, width: 36, color: Colors.grey[200]),
              ],
            ),
          )
        ],
      );
    } else if (templateId == 'classic') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Centered Header Mock
          Center(
            child: Container(height: 10, width: 44, color: const Color(0xFF1A1A2E)),
          ),
          const SizedBox(height: 8),
          Container(height: 1, color: Colors.grey[300]),
          const SizedBox(height: 8),
          Container(height: 4, width: double.infinity, color: Colors.grey[200]),
          const SizedBox(height: 4),
          Container(height: 4, width: 48, color: Colors.grey[200]),
        ],
      );
    } else {
      // Minimal layout
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 8, width: 36, color: const Color(0xFF2B2D42)),
          const SizedBox(height: 12),
          Container(height: 4, width: double.infinity, color: Colors.grey[200]),
          const SizedBox(height: 4),
          Container(height: 4, width: 32, color: Colors.grey[200]),
        ],
      );
    }
  }

  Widget _buildColorSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Accent Color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
          ),
          const SizedBox(height: 16),
          Obx(() {
            final selectedColor = controller.designState.value.accentColor;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: AppColors.accentHexes.map((hex) {
                final isSelected = selectedColor.toLowerCase() == hex.toLowerCase();
                final color = AppColors.fromHex(hex);
                return GestureDetector(
                  onTap: () => controller.updateAccentColor(hex),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: Colors.white, width: 3)
                          : Border.all(color: Colors.transparent),
                    ),
                    alignment: Alignment.center,
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFontSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Font Family',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
          ),
          const SizedBox(height: 16),
          Obx(() {
            final selectedFont = controller.designState.value.font;
            return DropdownButtonFormField<String>(
              value: selectedFont,
              items: ['Inter', 'Georgia']
                  .map((f) => DropdownMenuItem(value: f, child: Text(f, style: TextStyle(fontFamily: f))))
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  controller.updateFont(val);
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            );
          }),
        ],
      ),
    );
  }
}
