import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../data/models/resume_model.dart';
import '../../../../data/models/design_model.dart';
import '../../../../core/constants/app_colors.dart';

class ModernTemplateWidget extends StatelessWidget {
  final ResumeData resume;
  final DesignState design;

  const ModernTemplateWidget({super.key, required this.resume, required this.design});

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.fromHex(design.accentColor);
    final fontTitle = design.font == 'Inter' ? 'Inter' : 'Georgia';
    final fontBody = design.font == 'Inter' ? 'Inter' : 'Georgia';

    ImageProvider? photoProvider;
    if (resume.personalInfo.photo.isNotEmpty) {
      try {
        final base64Str = resume.personalInfo.photo.split(',').last;
        photoProvider = MemoryImage(base64Decode(base64Str));
      } catch (_) {}
    }

    return Container(
      width: 794,
      height: 1123,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left Sidebar Column
          Container(
            width: 260,
            color: const Color(0xFF1A365D), // Dark Blue
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar Photo
                if (photoProvider != null) ...[
                  Center(
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: photoProvider, fit: BoxFit.cover),
                        border: Border.all(color: Colors.white24, width: 3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                
                // Name and title
                Center(
                  child: Column(
                    children: [
                      Text(
                        resume.personalInfo.fullName.isEmpty ? 'Your Name' : resume.personalInfo.fullName,
                        style: TextStyle(
                          fontFamily: fontTitle,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        resume.personalInfo.title.isEmpty ? 'Professional Title' : resume.personalInfo.title,
                        style: TextStyle(
                          fontFamily: fontBody,
                          fontSize: 10,
                          color: Colors.white70,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(color: Colors.white30),
                const SizedBox(height: 16),

                // Details Section
                Text(
                  'Personal Detail',
                  style: TextStyle(fontFamily: fontTitle, fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                _sidebarItem('Email', resume.personalInfo.email, fontBody),
                _sidebarItem('Phone', resume.personalInfo.phone, fontBody),
                _sidebarItem('Address', resume.personalInfo.location, fontBody),
                _sidebarItem('LinkedIn', resume.personalInfo.linkedin, fontBody),
                
                const SizedBox(height: 16),
                const Divider(color: Colors.white30),
                const SizedBox(height: 16),

                // Hard Skills
                if (resume.hardSkills.isNotEmpty) ...[
                  Text(
                    'Hard Skills',
                    style: TextStyle(fontFamily: fontTitle, fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  ...resume.hardSkills.map((s) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      '• ${s.name} (${s.level})',
                      style: TextStyle(fontFamily: fontBody, fontSize: 11, color: Colors.white70),
                    ),
                  )),
                  const SizedBox(height: 16),
                ],

                // Languages
                if (resume.languages.isNotEmpty) ...[
                  Text(
                    'Languages',
                    style: TextStyle(fontFamily: fontTitle, fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  ...resume.languages.map((l) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      '• ${l.name} (${l.level})',
                      style: TextStyle(fontFamily: fontBody, fontSize: 11, color: Colors.white70),
                    ),
                  )),
                ],
              ],
            ),
          ),

          // Right Content Column
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Summary
                  if (resume.personalInfo.summary.isNotEmpty) ...[
                    Text(
                      'Profile',
                      style: TextStyle(fontFamily: fontTitle, fontSize: 18, fontWeight: FontWeight.bold, color: accentColor),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      resume.personalInfo.summary,
                      style: TextStyle(fontFamily: fontBody, fontSize: 12, height: 1.5, color: Colors.black87),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Work Experience
                  if (resume.experience.isNotEmpty) ...[
                    Text(
                      'Employment History',
                      style: TextStyle(fontFamily: fontTitle, fontSize: 18, fontWeight: FontWeight.bold, color: accentColor),
                    ),
                    const SizedBox(height: 12),
                    ...resume.experience.map((exp) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${exp.company}${exp.location.isNotEmpty ? ", ${exp.location}" : ""}',
                                style: TextStyle(fontFamily: fontTitle, fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${exp.startDate} — ${exp.current ? 'Present' : exp.endDate}',
                                style: TextStyle(fontFamily: fontBody, fontSize: 10, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          if (exp.position.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            Text(
                              exp.position,
                              style: TextStyle(fontFamily: fontBody, fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                            ),
                          ],
                          const SizedBox(height: 4),
                          Text(
                            exp.description,
                            style: TextStyle(fontFamily: fontBody, fontSize: 12, height: 1.4, color: Colors.black87),
                          ),
                        ],
                      ),
                    )),
                    const SizedBox(height: 16),
                  ],

                  // Education
                  if (resume.education.isNotEmpty) ...[
                    Text(
                      'Education',
                      style: TextStyle(fontFamily: fontTitle, fontSize: 18, fontWeight: FontWeight.bold, color: accentColor),
                    ),
                    const SizedBox(height: 12),
                    ...resume.education.map((edu) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
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
                                '${edu.startDate} — ${edu.endDate}',
                                style: TextStyle(fontFamily: fontBody, fontSize: 10, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            edu.description,
                            style: TextStyle(fontFamily: fontBody, fontSize: 12, height: 1.4, color: Colors.black87),
                          ),
                        ],
                      ),
                    )),
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _sidebarItem(String label, String value, String font) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontFamily: font, fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white70)),
          const SizedBox(height: 1),
          Text(value, style: TextStyle(fontFamily: font, fontSize: 11, color: Colors.white)),
        ],
      ),
    );
  }
}
