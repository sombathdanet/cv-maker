import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/edit_tab_widget.dart';
import '../widgets/design_tab_widget.dart';
import '../widgets/resume_preview_panel.dart';
import '../../../../core/constants/app_colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Custom App Header (Height: 64 on Desktop, 56 on Mobile)
            _buildCustomHeader(context),

            // 2. Main Content Split View
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isLargeScreen = constraints.maxWidth >= 900;

                  if (isLargeScreen) {
                    // Desktop layout: Side-by-side
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Left Panel: Form Editor
                        Expanded(
                          flex: 11,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => FadeIndexedStack(
                                      index:
                                          controller.activeTab.value == 'edit'
                                          ? 0
                                          : 1,
                                      children: const [
                                        EditTabWidget(),
                                        DesignTabWidget(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Vertical Border Slate 200
                        Container(width: 1, color: const Color(0xFFE2E8F0)),

                        // Right Panel: Live Preview Panel
                        Expanded(flex: 9, child: _buildPreviewPaneContainer()),
                      ],
                    );
                  } else {
                    // Mobile layout: 3-tab FadeIndexedStack
                    return Obx(
                      () => FadeIndexedStack(
                        index: controller.mobileTabIndex.value,
                        children: [
                          const EditTabWidget(),
                          const DesignTabWidget(),
                          _buildPreviewPaneContainer(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        final isMobile = MediaQuery.of(context).size.width < 900;
        if (!isMobile) return const SizedBox.shrink();

        return Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.mobileTabIndex.value,
            onTap: (index) {
              FocusManager.instance.primaryFocus?.unfocus();
              controller.mobileTabIndex.value = index;
            },
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF3B82F6), // blue-500
            unselectedItemColor: const Color(0xFF64748B), // slate-500
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.edit_note_outlined, size: 22),
                activeIcon: const Icon(Icons.edit_note, size: 22),
                label: 'edit'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.palette_outlined, size: 20),
                activeIcon: const Icon(Icons.palette, size: 20),
                label: 'design'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.remove_red_eye_outlined, size: 20),
                activeIcon: const Icon(Icons.remove_red_eye, size: 20),
                label: 'preview'.tr,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCustomHeader(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    if (isMobile) {
      return Container(
        height: 56,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Title / Logo
            const Text(
              'CV Builder',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                color: Color(0xFF1E293B),
              ),
            ),

            // Right: Languages flag switcher
            Row(
              children: [
                _buildLangButton(
                  flag: '🇰🇭',
                  label: 'KH',
                  locale: const Locale('km', 'KH'),
                ),
                const SizedBox(width: 8),
                Container(width: 1, height: 14, color: const Color(0xFFCBD5E1)),
                const SizedBox(width: 8),
                _buildLangButton(
                  flag: '🇬🇧',
                  label: 'EN',
                  locale: const Locale('en', 'US'),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Desktop Custom Header (Row style)
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Language switches (Row)
          Row(
            children: [
              _buildLangButton(
                flag: '🇰🇭',
                label: 'Cambodia',
                locale: const Locale('km', 'KH'),
              ),
              const SizedBox(width: 12),
              Container(width: 1, height: 16, color: const Color(0xFFCBD5E1)),
              const SizedBox(width: 12),
              _buildLangButton(
                flag: '🇬🇧',
                label: 'English (UK)',
                locale: const Locale('en', 'US'),
              ),
            ],
          ),

          // Right Side: Tab switcher and Mobile toggle
          Row(
            children: [
              // Capsule tab switcher
              _buildPillTabSwitcher(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLangButton({
    required String flag,
    required String label,
    required Locale locale,
  }) {
    return InkWell(
      onTap: () => Get.updateLocale(locale),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF475569),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPillTabSwitcher() {
    return Container(
      width: 220,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9), // slate-100 track background
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Obx(() {
        final active = controller.activeTab.value;
        final isEdit = active == 'edit';

        return Stack(
          children: [
            // Sliding capsule background
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: isEdit ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 104, // (220 / 2) - 4 padding - 2 margin = 104
                height: 36,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),

            // Tab buttons layered on top
            Row(
              children: [
                Expanded(
                  child: _buildPillTabItem('edit'.tr, isEdit, () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.activeTab.value = 'edit';
                  }),
                ),
                Expanded(
                  child: _buildPillTabItem('design'.tr, !isEdit, () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.activeTab.value = 'design';
                  }),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPillTabItem(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: isSelected
                ? const Color(0xFF1E293B)
                : const Color(0xFF64748B),
          ),
          child: Text(label),
        ),
      ),
    );
  }

  Widget _buildPreviewPaneContainer() {
    return Container(
      color: const Color(0xFF475569), // bg-slate-600 background
      child: Column(
        children: [
          // Preview header bar (Height: 48)
          Container(
            height: 48,
            color: const Color(0xFF1E293B), // bg-slate-800
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Live Preview',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6), // bg-blue-500
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    icon: controller.exporting.value
                        ? const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(Icons.download, size: 14),
                    label: Text(
                      controller.exporting.value
                          ? 'generating'.tr
                          : 'download_pdf'.tr,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: controller.exporting.value
                        ? null
                        : controller.exportPdf,
                  ),
                ),
              ],
            ),
          ),

          // Expanded live preview rendering panel
          const Expanded(child: ResumePreviewPanel()),
        ],
      ),
    );
  }
}

// Custom GPU-accelerated cross-fade IndexedStack preserving children state
class FadeIndexedStack extends StatelessWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const FadeIndexedStack({
    super.key,
    required this.index,
    required this.children,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(children.length, (i) {
        final isSelected = i == index;
        return IgnorePointer(
          ignoring: !isSelected,
          child: AnimatedOpacity(
            opacity: isSelected ? 1.0 : 0.0,
            duration: duration,
            curve: Curves.easeInOut,
            child: children[i],
          ),
        );
      }),
    );
  }
}
