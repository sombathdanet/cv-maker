import 'dart:convert';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../data/models/resume_model.dart';
import '../../data/models/design_model.dart';

class PdfGenerator {
  static Future<Uint8List> generate(ResumeData resume, DesignState design) async {
    final pdf = pw.Document();

    final accentColor = PdfColor.fromHex(design.accentColor);
    final isModern = design.template == 'modern';
    final isMinimal = design.template == 'minimal';

    // Fonts definition
    final fontTitle = design.font == 'Inter' ? pw.Font.helveticaBold() : pw.Font.timesBold();
    final fontBody = design.font == 'Inter' ? pw.Font.helvetica() : pw.Font.times();

    // Prepare profile photo if exists
    pw.ImageProvider? profileImage;
    if (resume.personalInfo.photo.isNotEmpty) {
      try {
        final decodedBytes = base64Decode(resume.personalInfo.photo.split(',').last);
        profileImage = pw.MemoryImage(decodedBytes);
      } catch (_) {}
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.only(
          top: design.margins.top.toDouble(),
          right: design.margins.right.toDouble(),
          bottom: design.margins.bottom.toDouble(),
          left: design.margins.left.toDouble(),
        ),
        build: (pw.Context context) {
          if (isModern) {
            // Modern 2-column sidebar layout
            return pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              children: [
                // Left Column (Sidebar)
                pw.Container(
                  width: 200,
                  color: PdfColor.fromHex('#1a365d'),
                  padding: const pw.EdgeInsets.all(12),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // Photo
                      if (profileImage != null)
                        pw.Align(
                          alignment: pw.Alignment.center,
                          child: pw.Container(
                            width: 80,
                            height: 80,
                            decoration: const pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                            ),
                            child: pw.ClipOval(
                              child: pw.Image(profileImage, fit: pw.BoxFit.cover),
                            ),
                          ),
                        ),
                      pw.SizedBox(height: 12),
                      
                      // Name & Job Title
                      pw.Text(
                        resume.personalInfo.fullName.isEmpty ? 'Your Name' : resume.personalInfo.fullName,
                        style: pw.TextStyle(font: fontTitle, fontSize: 16, color: PdfColors.white),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.Text(
                        resume.personalInfo.title.isEmpty ? 'Professional Title' : resume.personalInfo.title,
                        style: pw.TextStyle(font: fontBody, fontSize: 9, color: PdfColors.white),
                        textAlign: pw.TextAlign.center,
                      ),
                      pw.Divider(color: PdfColors.white),
                      pw.SizedBox(height: 8),

                      // Personal Details
                      pw.Text('Personal Details', style: pw.TextStyle(font: fontTitle, fontSize: 11, color: PdfColors.white)),
                      pw.SizedBox(height: 4),
                      if (resume.personalInfo.email.isNotEmpty)
                        pw.Text('Email: ${resume.personalInfo.email}', style: pw.TextStyle(font: fontBody, fontSize: 8, color: PdfColors.white)),
                      if (resume.personalInfo.phone.isNotEmpty)
                        pw.Text('Tel: ${resume.personalInfo.phone}', style: pw.TextStyle(font: fontBody, fontSize: 8, color: PdfColors.white)),
                      if (resume.personalInfo.location.isNotEmpty)
                        pw.Text('Address: ${resume.personalInfo.location}', style: pw.TextStyle(font: fontBody, fontSize: 8, color: PdfColors.white)),
                      if (resume.personalInfo.linkedin.isNotEmpty)
                        pw.Text('LinkedIn: ${resume.personalInfo.linkedin}', style: pw.TextStyle(font: fontBody, fontSize: 8, color: PdfColors.white)),

                      pw.SizedBox(height: 12),

                      // Hard Skills
                      if (resume.hardSkills.isNotEmpty) ...[
                        pw.Text('Hard Skills', style: pw.TextStyle(font: fontTitle, fontSize: 11, color: PdfColors.white)),
                        pw.SizedBox(height: 4),
                        ...resume.hardSkills.map((skill) => pw.Bullet(
                              text: '${skill.name} (${skill.level})',
                              style: pw.TextStyle(font: fontBody, fontSize: 8, color: PdfColors.white),
                            )),
                        pw.SizedBox(height: 12),
                      ],

                      // Languages
                      if (resume.languages.isNotEmpty) ...[
                        pw.Text('Languages', style: pw.TextStyle(font: fontTitle, fontSize: 11, color: PdfColors.white)),
                        pw.SizedBox(height: 4),
                        ...resume.languages.map((lang) => pw.Bullet(
                              text: '${lang.name} (${lang.level})',
                              style: pw.TextStyle(font: fontBody, fontSize: 8, color: PdfColors.white),
                            )),
                      ]
                    ],
                  ),
                ),
                pw.SizedBox(width: 16),
                
                // Right Column (Main content)
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      // Summary
                      if (resume.personalInfo.summary.isNotEmpty) ...[
                        pw.Text('Profile Summary', style: pw.TextStyle(font: fontTitle, fontSize: 14, color: accentColor)),
                        pw.Divider(color: accentColor),
                        pw.Text(resume.personalInfo.summary, style: pw.TextStyle(font: fontBody, fontSize: 10)),
                        pw.SizedBox(height: 16),
                      ],

                      // Experience
                      if (resume.experience.isNotEmpty) ...[
                        pw.Text('Employment History', style: pw.TextStyle(font: fontTitle, fontSize: 14, color: accentColor)),
                        pw.Divider(color: accentColor),
                        ...resume.experience.map((exp) => pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text('${exp.company} - ${exp.position}', style: pw.TextStyle(font: fontTitle, fontSize: 11)),
                                pw.Text('${exp.startDate} - ${exp.current ? 'Present' : exp.endDate}', style: pw.TextStyle(font: fontBody, fontSize: 9, color: PdfColors.grey)),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Text(exp.description, style: pw.TextStyle(font: fontBody, fontSize: 9)),
                            pw.SizedBox(height: 8),
                          ],
                        )),
                        pw.SizedBox(height: 16),
                      ],

                      // Education
                      if (resume.education.isNotEmpty) ...[
                        pw.Text('Education', style: pw.TextStyle(font: fontTitle, fontSize: 14, color: accentColor)),
                        pw.Divider(color: accentColor),
                        ...resume.education.map((edu) => pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text('${edu.school} - ${edu.degree}', style: pw.TextStyle(font: fontTitle, fontSize: 11)),
                                pw.Text('${edu.startDate} - ${edu.endDate}', style: pw.TextStyle(font: fontBody, fontSize: 9, color: PdfColors.grey)),
                              ],
                            ),
                            pw.SizedBox(height: 2),
                            pw.Text(edu.description, style: pw.TextStyle(font: fontBody, fontSize: 9)),
                            pw.SizedBox(height: 8),
                          ],
                        )),
                      ],
                    ],
                  ),
                ),
              ],
            );
          } else {
            // Classic / Minimal Single Column layout
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Center(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text(
                        resume.personalInfo.fullName.isEmpty ? 'Your Name' : resume.personalInfo.fullName,
                        style: pw.TextStyle(font: fontTitle, fontSize: 22, color: accentColor),
                      ),
                      pw.Text(
                        resume.personalInfo.title,
                        style: pw.TextStyle(font: fontBody, fontSize: 12, color: PdfColors.grey),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Text(
                        '${resume.personalInfo.email}  |  ${resume.personalInfo.phone}  |  ${resume.personalInfo.location}',
                        style: pw.TextStyle(font: fontBody, fontSize: 9),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 16),
                
                // Summary
                if (resume.personalInfo.summary.isNotEmpty) ...[
                  pw.Text('Profile Summary', style: pw.TextStyle(font: fontTitle, fontSize: 13, color: accentColor)),
                  if (!isMinimal) pw.Divider(color: accentColor),
                  pw.Text(resume.personalInfo.summary, style: pw.TextStyle(font: fontBody, fontSize: 10)),
                  pw.SizedBox(height: 14),
                ],

                // Experience
                if (resume.experience.isNotEmpty) ...[
                  pw.Text('Employment History', style: pw.TextStyle(font: fontTitle, fontSize: 13, color: accentColor)),
                  if (!isMinimal) pw.Divider(color: accentColor),
                  ...resume.experience.map((exp) => pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('${exp.company} - ${exp.position}', style: pw.TextStyle(font: fontTitle, fontSize: 10)),
                          pw.Text('${exp.startDate} - ${exp.current ? 'Present' : exp.endDate}', style: pw.TextStyle(font: fontBody, fontSize: 9, color: PdfColors.grey)),
                        ],
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text(exp.description, style: pw.TextStyle(font: fontBody, fontSize: 9)),
                      pw.SizedBox(height: 6),
                    ],
                  )),
                  pw.SizedBox(height: 14),
                ],

                // Education
                if (resume.education.isNotEmpty) ...[
                  pw.Text('Education', style: pw.TextStyle(font: fontTitle, fontSize: 13, color: accentColor)),
                  if (!isMinimal) pw.Divider(color: accentColor),
                  ...resume.education.map((edu) => pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('${edu.school} - ${edu.degree}', style: pw.TextStyle(font: fontTitle, fontSize: 10)),
                          pw.Text('${edu.startDate} - ${edu.endDate}', style: pw.TextStyle(font: fontBody, fontSize: 9, color: PdfColors.grey)),
                        ],
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text(edu.description, style: pw.TextStyle(font: fontBody, fontSize: 9)),
                      pw.SizedBox(height: 6),
                    ],
                  )),
                  pw.SizedBox(height: 14),
                ],

                // Skills & Languages
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    if (resume.hardSkills.isNotEmpty)
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Skills', style: pw.TextStyle(font: fontTitle, fontSize: 13, color: accentColor)),
                            if (!isMinimal) pw.Divider(color: accentColor),
                            ...resume.hardSkills.map((s) => pw.Bullet(
                              text: '${s.name} (${s.level})',
                              style: pw.TextStyle(font: fontBody, fontSize: 9),
                            )),
                          ],
                        ),
                      ),
                    pw.SizedBox(width: 20),
                    if (resume.languages.isNotEmpty)
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Languages', style: pw.TextStyle(font: fontTitle, fontSize: 13, color: accentColor)),
                            if (!isMinimal) pw.Divider(color: accentColor),
                            ...resume.languages.map((l) => pw.Bullet(
                              text: '${l.name} (${l.level})',
                              style: pw.TextStyle(font: fontBody, fontSize: 9),
                            )),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );

    return pdf.save();
  }
}
