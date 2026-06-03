import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'templates/classic_template.dart';
import 'templates/modern_template.dart';
import 'templates/minimal_template.dart';

class ResumePreviewPanel extends GetView<HomeController> {
  const ResumePreviewPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[700],
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Obx(() {
            final resume = controller.resumeData.value;
            final design = controller.designState.value;

            Widget templateWidget;
            switch (design.template) {
              case 'classic':
                templateWidget = ClassicTemplateWidget(resume: resume, design: design);
                break;
              case 'minimal':
                templateWidget = MinimalTemplateWidget(resume: resume, design: design);
                break;
              case 'modern':
              default:
                templateWidget = ModernTemplateWidget(resume: resume, design: design);
                break;
            }

            return FittedBox(
              fit: BoxFit.contain,
              child: Card(
                elevation: 10,
                shadowColor: Colors.black45,
                margin: EdgeInsets.zero,
                clipBehavior: Clip.antiAlias,
                child: templateWidget,
              ),
            );
          });
        },
      ),
    );
  }
}
