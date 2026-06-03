import 'package:flutter/material.dart';
import '../../../../data/models/resume_model.dart';
import '../../../../data/models/design_model.dart';
import '../../../../core/constants/app_colors.dart';

class ClassicTemplateWidget extends StatelessWidget {
  final ResumeData resume;
  final DesignState design;

  const ClassicTemplateWidget({super.key, required this.resume, required this.design});

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.fromHex(design.accentColor);
    final fontTitle = design.font == 'Inter' ? 'Inter' : 'Georgia';
    final fontBody = design.font == 'Inter' ? 'Inter' : 'Georgia';

    return Container(
      width: 794,
      height: 1123,
      padding: EdgeInsets.only(
        top: design.margins.top.toDouble() * 2,
        right: design.margins.right.toDouble() * 2,
        bottom: design.margins.bottom.toDouble() * 2,
        left: design.margins.left.toDouble() * 2,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header / Contact info
          Center(
            child: Column(
              children: [
                Text(
                  resume.personalInfo.fullName.isEmpty ? 'Your Name' : resume.personalInfo.fullName,
                  style: TextStyle(
                    fontFamily: fontTitle,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
                if (resume.personalInfo.title.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    resume.personalInfo.title,
                    style: TextStyle(
                      fontFamily: fontBody,
                      fontSize: 14,
                      color: Colors.grey[600],
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  '${resume.personalInfo.email}  |  ${resume.personalInfo.phone}  |  ${resume.personalInfo.location}',
                  style: TextStyle(fontFamily: fontBody, fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Summary Section
          if (resume.personalInfo.summary.isNotEmpty) ...[
            Text(
              'Profile Summary',
              style: TextStyle(fontFamily: fontTitle, fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
            ),
            Divider(color: accentColor, thickness: 1.5),
            Text(
              resume.personalInfo.summary,
              style: TextStyle(fontFamily: fontBody, fontSize: 12, height: 1.5),
            ),
            const SizedBox(height: 20),
          ],

          // Experience Section
          if (resume.experience.isNotEmpty) ...[
            Text(
              'Work Experience',
              style: TextStyle(fontFamily: fontTitle, fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
            ),
            Divider(color: accentColor, thickness: 1.5),
            ...resume.experience.map((exp) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${exp.company} - ${exp.position}',
                        style: TextStyle(fontFamily: fontTitle, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${exp.startDate} - ${exp.current ? 'Present' : exp.endDate}',
                        style: TextStyle(fontFamily: fontBody, fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    exp.description,
                    style: TextStyle(fontFamily: fontBody, fontSize: 12, height: 1.4),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 20),
          ],

          // Education Section
          if (resume.education.isNotEmpty) ...[
            Text(
              'Education',
              style: TextStyle(fontFamily: fontTitle, fontSize: 16, fontWeight: FontWeight.bold, color: accentColor),
            ),
            Divider(color: accentColor, thickness: 1.5),
            ...resume.education.map((edu) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${edu.school} - ${edu.degree}',
                        style: TextStyle(fontFamily: fontTitle, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${edu.startDate} - ${edu.endDate}',
                        style: TextStyle(fontFamily: fontBody, fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    edu.description,
                    style: TextStyle(fontFamily: fontBody, fontSize: 12, height: 1.4),
                  ),
                ],
              ),
            )),
          ],
        ],
      ),
    );
  }
}
