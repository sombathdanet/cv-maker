import 'package:flutter/material.dart';
import '../../../../data/models/resume_model.dart';
import '../../../../data/models/design_model.dart';
import '../../../../core/constants/app_colors.dart';

class MinimalTemplateWidget extends StatelessWidget {
  final ResumeData resume;
  final DesignState design;

  const MinimalTemplateWidget({super.key, required this.resume, required this.design});

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.fromHex(design.accentColor);
    const fontTitle = 'Inter';
    const fontBody = 'Inter';

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
          // Name and Job Title
          Text(
            resume.personalInfo.fullName.isEmpty ? 'Your Name' : resume.personalInfo.fullName,
            style: const TextStyle(
              fontFamily: fontTitle,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (resume.personalInfo.title.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              resume.personalInfo.title,
              style: TextStyle(
                fontFamily: fontBody,
                fontSize: 12,
                color: accentColor,
                letterSpacing: 0.5,
              ),
            ),
          ],
          const SizedBox(height: 8),
          
          // Contact Row
          Wrap(
            spacing: 12,
            children: [
              if (resume.personalInfo.email.isNotEmpty) Text(resume.personalInfo.email, style: const TextStyle(fontFamily: fontBody, fontSize: 10, color: Colors.black54)),
              if (resume.personalInfo.phone.isNotEmpty) Text(resume.personalInfo.phone, style: const TextStyle(fontFamily: fontBody, fontSize: 10, color: Colors.black54)),
              if (resume.personalInfo.location.isNotEmpty) Text(resume.personalInfo.location, style: const TextStyle(fontFamily: fontBody, fontSize: 10, color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 20),

          // Profile Summary
          if (resume.personalInfo.summary.isNotEmpty) ...[
            _sectionHeader('Profile', accentColor),
            Text(
              resume.personalInfo.summary,
              style: const TextStyle(fontFamily: fontBody, fontSize: 11, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 16),
          ],

          // Experience Section
          if (resume.experience.isNotEmpty) ...[
            _sectionHeader('Experience', accentColor),
            ...resume.experience.map((exp) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${exp.company} — ${exp.position}',
                        style: const TextStyle(fontFamily: fontTitle, fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      Text(
                        '${exp.startDate} - ${exp.current ? 'Present' : exp.endDate}',
                        style: const TextStyle(fontFamily: fontBody, fontSize: 10, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    exp.description,
                    style: const TextStyle(fontFamily: fontBody, fontSize: 11, height: 1.4, color: Colors.black87),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 16),
          ],

          // Education Section
          if (resume.education.isNotEmpty) ...[
            _sectionHeader('Education', accentColor),
            ...resume.education.map((edu) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${edu.school} — ${edu.degree}',
                        style: const TextStyle(fontFamily: fontTitle, fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      Text(
                        '${edu.startDate} - ${edu.endDate}',
                        style: const TextStyle(fontFamily: fontBody, fontSize: 10, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    edu.description,
                    style: const TextStyle(fontFamily: fontBody, fontSize: 11, height: 1.4, color: Colors.black87),
                  ),
                ],
              ),
            )),
          ],
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, Color accent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(fontFamily: 'Inter', fontSize: 11, fontWeight: FontWeight.bold, color: accent, letterSpacing: 1.0),
        ),
        const SizedBox(height: 2),
        Container(height: 1, color: Colors.black12),
        const SizedBox(height: 8),
      ],
    );
  }
}
