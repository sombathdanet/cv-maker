import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/home_controller.dart';
import '../../../../core/constants/app_spacing.dart';

class EditTabWidget extends GetView<HomeController> {
  const EditTabWidget({super.key});

  Future<void> _pickPhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      final base64Str = 'data:image/png;base64,${base64Encode(bytes)}';
      final info = controller.resumeData.value.personalInfo;
      controller.updatePersonalInfo(info.copyWith(photo: base64Str));
    }
  }

  void _removePhoto() {
    final info = controller.resumeData.value.personalInfo;
    controller.updatePersonalInfo(info.copyWith(photo: ''));
  }

  @override
  Widget build(BuildContext context) {
    final showExtended = controller.showExtendedDetails;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          // 1. Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '85%',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    AppSpacing.widthSm,
                    const Text(
                      'CV completeness',
                      style: TextStyle(fontSize: 14, color: Color(0xFF64748B), fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                AppSpacing.heightSm,
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.85,
                    minHeight: 5,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ],
            ),
          ),
          AppSpacing.heightMd,

          // 2. Personal Details
          Obx(() {
            final info = controller.resumeData.value.personalInfo;
            return CollapsibleSection(
              title: 'personal_info'.tr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildResponsiveRow(
                    isMobile: isMobile,
                    child1: _buildField(
                      'Job Title',
                      TextFormField(
                        initialValue: info.title,
                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(title: val)),
                        decoration: const InputDecoration(hintText: 'e.g., Senior Developer'),
                      ),
                    ),
                    child2: _buildField(
                      'full_name'.tr,
                      TextFormField(
                        initialValue: info.fullName,
                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(fullName: val)),
                        decoration: const InputDecoration(hintText: 'First Name & Surname'),
                      ),
                    ),
                  ),
                  _spacer(isMobile),
                  _buildResponsiveRow(
                    isMobile: isMobile,
                    child1: _buildField(
                      'email'.tr,
                      TextFormField(
                        initialValue: info.email,
                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(email: val)),
                        decoration: const InputDecoration(hintText: 'email@domain.com'),
                      ),
                    ),
                    child2: _buildField(
                      'linkedin'.tr,
                      TextFormField(
                        initialValue: info.linkedin,
                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(linkedin: val)),
                        decoration: const InputDecoration(hintText: 'linkedin.com/in/username'),
                      ),
                    ),
                  ),
                  _spacer(isMobile),
                  _buildResponsiveRow(
                    isMobile: isMobile,
                    child1: _buildField(
                      'Profile Photo',
                      Row(
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: info.photo.isNotEmpty
                                ? Image.memory(
                                    base64Decode(info.photo.split(',').last),
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.person, color: Color(0xFF60A5FA), size: 32),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(Icons.edit, size: 14, color: Colors.blue),
                                  label: const Text('Edit photo', style: TextStyle(color: Colors.blue, fontSize: 13, fontWeight: FontWeight.bold)),
                                  onPressed: _pickPhoto,
                                ),
                                if (info.photo.isNotEmpty)
                                  TextButton.icon(
                                    icon: const Icon(Icons.delete, size: 14, color: Colors.red),
                                    label: const Text('Delete', style: TextStyle(color: Colors.red, fontSize: 13)),
                                    onPressed: _removePhoto,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    child2: _buildField(
                      'location'.tr,
                      TextFormField(
                        initialValue: info.location,
                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(location: val)),
                        decoration: const InputDecoration(hintText: 'City, Country'),
                      ),
                    ),
                  ),
                  _spacer(isMobile),
                  _buildResponsiveRow(
                    isMobile: isMobile,
                    child1: _buildField(
                      'website'.tr,
                      TextFormField(
                        initialValue: info.website,
                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(website: val)),
                        decoration: const InputDecoration(hintText: 'e.g., portfolio.com'),
                      ),
                    ),
                    child2: _buildField(
                      'phone'.tr,
                      TextFormField(
                        initialValue: info.phone,
                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(phone: val)),
                        decoration: const InputDecoration(hintText: '+123456789'),
                      ),
                    ),
                  ),
                  AppSpacing.heightLg,

                  // Show More Details Toggle
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: () => showExtended.value = !showExtended.value,
                      icon: Obx(() => Icon(showExtended.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.blue)),
                      label: Obx(() => Text(showExtended.value ? 'Hide details' : 'Add more details', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                    ),
                  ),

                  // Collapsible Extended Details
                  Obx(() => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: showExtended.value
                            ? Column(
                                children: [
                                  const SizedBox(height: 16),
                                  _buildResponsiveRow(
                                    isMobile: isMobile,
                                    child1: _buildField(
                                      'apply_for'.tr,
                                      TextFormField(
                                        initialValue: info.applyFor,
                                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(applyFor: val)),
                                        decoration: const InputDecoration(hintText: 'e.g., Senior Architect'),
                                      ),
                                    ),
                                    child2: _buildField(
                                      'gender'.tr,
                                      DropdownButtonFormField<String>(
                                        value: info.gender,
                                        items: ['Male', 'Female', 'Other']
                                            .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                                            .toList(),
                                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(gender: val)),
                                        decoration: const InputDecoration(hintText: 'Select...'),
                                      ),
                                    ),
                                  ),
                                  _spacer(isMobile),
                                  _buildResponsiveRow(
                                    isMobile: isMobile,
                                    child1: _buildField(
                                      'dob'.tr,
                                      TextFormField(
                                        initialValue: info.dateOfBirth,
                                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(dateOfBirth: val)),
                                        decoration: const InputDecoration(hintText: 'YYYY-MM-DD'),
                                      ),
                                    ),
                                    child2: _buildField(
                                      'pob'.tr,
                                      TextFormField(
                                        initialValue: info.placeOfBirth,
                                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(placeOfBirth: val)),
                                      ),
                                    ),
                                  ),
                                  _spacer(isMobile),
                                  _buildResponsiveRow(
                                    isMobile: isMobile,
                                    child1: _buildField(
                                      'nationality'.tr,
                                      TextFormField(
                                        initialValue: info.nationality,
                                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(nationality: val)),
                                      ),
                                    ),
                                    child2: _buildField(
                                      'marital_status'.tr,
                                      DropdownButtonFormField<String>(
                                        value: info.maritalStatus,
                                        items: ['Single', 'Married', 'Divorced', 'Widowed']
                                            .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                                            .toList(),
                                        onChanged: (val) => controller.updatePersonalInfo(info.copyWith(maritalStatus: val)),
                                        decoration: const InputDecoration(hintText: 'Select...'),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      )),
                ],
              ),
            );
          }),
          AppSpacing.heightMd,

          // 3. Professional Summary
          Obx(() {
            final info = controller.resumeData.value.personalInfo;
            return CollapsibleSection(
              title: 'summary'.tr,
              subtitle: 'Write 2-4 short, energetic sentences about how great you are.',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Mock rich text editor toolbar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                      border: Border(
                        top: BorderSide(color: Color(0xFFE2E8F0)),
                        left: BorderSide(color: Color(0xFFE2E8F0)),
                        right: BorderSide(color: Color(0xFFE2E8F0)),
                        bottom: BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final useColumn = constraints.maxWidth < 380;
                        if (useColumn) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  _toolbarButton('B', bold: true),
                                  _toolbarButton('I', italic: true),
                                  _toolbarButton('U', underline: true),
                                  _toolbarButton('S', strikethrough: true),
                                  const SizedBox(width: 8),
                                  Container(width: 1, height: 16, color: Colors.grey[300]),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.list, size: 18, color: Colors.grey),
                                  const SizedBox(width: 12),
                                  const Icon(Icons.link, size: 18, color: Colors.grey),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.bolt, size: 14, color: Colors.blue),
                                  label: const Text('Get help with writing', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue[50],
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              _toolbarButton('B', bold: true),
                              _toolbarButton('I', italic: true),
                              _toolbarButton('U', underline: true),
                              _toolbarButton('S', strikethrough: true),
                              const SizedBox(width: 8),
                              Container(width: 1, height: 16, color: Colors.grey[300]),
                              const SizedBox(width: 8),
                              const Icon(Icons.list, size: 18, color: Colors.grey),
                              const SizedBox(width: 12),
                              const Icon(Icons.link, size: 18, color: Colors.grey),
                              const Spacer(),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.bolt, size: 14, color: Colors.blue),
                                label: const Text('Get help with writing', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue[50],
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  TextFormField(
                    initialValue: info.summary,
                    maxLines: 5,
                    onChanged: (val) => controller.updatePersonalInfo(info.copyWith(summary: val)),
                    decoration: const InputDecoration(
                      hintText: 'Summary details...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
                        borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          AppSpacing.heightMd,

          // 4. Work Experience
          Obx(() {
            final list = controller.resumeData.value.experience;
            return CollapsibleSection(
              title: 'experience'.tr,
              child: Column(
                children: [
                  ...list.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final exp = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Entry #${idx + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                                onPressed: () => controller.removeExperience(exp.id),
                              ),
                            ],
                          ),
                          _buildResponsiveRow(
                            isMobile: isMobile,
                            child1: _buildField(
                              'Job Title',
                              TextFormField(
                                initialValue: exp.position,
                                onChanged: (val) => controller.updateExperience(idx, exp.copyWith(position: val)),
                              ),
                            ),
                            child2: _buildField(
                              'Employer',
                              TextFormField(
                                initialValue: exp.company,
                                onChanged: (val) => controller.updateExperience(idx, exp.copyWith(company: val)),
                              ),
                            ),
                          ),
                          _spacer(isMobile),
                          _buildResponsiveRow(
                            isMobile: isMobile,
                            child1: Row(
                              children: [
                                Expanded(
                                  child: _buildField(
                                    'Start Date',
                                    TextFormField(
                                      initialValue: exp.startDate,
                                      onChanged: (val) => controller.updateExperience(idx, exp.copyWith(startDate: val)),
                                      decoration: const InputDecoration(hintText: 'YYYY-MM'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildField(
                                    'End Date',
                                    TextFormField(
                                      initialValue: exp.endDate,
                                      enabled: !exp.current,
                                      onChanged: (val) => controller.updateExperience(idx, exp.copyWith(endDate: val)),
                                      decoration: const InputDecoration(hintText: 'YYYY-MM'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            child2: _buildField(
                              'City',
                              TextFormField(
                                initialValue: exp.location,
                                onChanged: (val) => controller.updateExperience(idx, exp.copyWith(location: val)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Checkbox(
                                value: exp.current,
                                onChanged: (val) {
                                  if (val != null) {
                                    controller.updateExperience(idx, exp.copyWith(current: val));
                                  }
                                },
                              ),
                              Text('current_job'.tr, style: const TextStyle(fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _buildField(
                            'description'.tr,
                            TextFormField(
                              initialValue: exp.description,
                              maxLines: 3,
                              onChanged: (val) => controller.updateExperience(idx, exp.copyWith(description: val)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  _buildAddButton('Add employment', controller.addExperience),
                ],
              ),
            );
          }),
          AppSpacing.heightMd,

          // 5. Education
          Obx(() {
            final list = controller.resumeData.value.education;
            return CollapsibleSection(
              title: 'education'.tr,
              child: Column(
                children: [
                  ...list.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final edu = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Entry #${idx + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                                onPressed: () => controller.removeEducation(edu.id),
                              ),
                            ],
                          ),
                          _buildResponsiveRow(
                            isMobile: isMobile,
                            child1: _buildField(
                              'School',
                              TextFormField(
                                initialValue: edu.school,
                                onChanged: (val) => controller.updateEducation(idx, edu.copyWith(school: val)),
                              ),
                            ),
                            child2: _buildField(
                              'Degree',
                              TextFormField(
                                initialValue: edu.degree,
                                onChanged: (val) => controller.updateEducation(idx, edu.copyWith(degree: val)),
                              ),
                            ),
                          ),
                          _spacer(isMobile),
                          _buildResponsiveRow(
                            isMobile: isMobile,
                            child1: Row(
                              children: [
                                Expanded(
                                  child: _buildField(
                                    'Start Date',
                                    TextFormField(
                                      initialValue: edu.startDate,
                                      onChanged: (val) => controller.updateEducation(idx, edu.copyWith(startDate: val)),
                                      decoration: const InputDecoration(hintText: 'YYYY-MM'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildField(
                                    'End Date',
                                    TextFormField(
                                      initialValue: edu.endDate,
                                      onChanged: (val) => controller.updateEducation(idx, edu.copyWith(endDate: val)),
                                      decoration: const InputDecoration(hintText: 'YYYY-MM'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            child2: _buildField(
                              'Field of Study',
                              TextFormField(
                                initialValue: edu.field,
                                onChanged: (val) => controller.updateEducation(idx, edu.copyWith(field: val)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildField(
                            'description'.tr,
                            TextFormField(
                              initialValue: edu.description,
                              maxLines: 2,
                              onChanged: (val) => controller.updateEducation(idx, edu.copyWith(description: val)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  _buildAddButton('Add education', controller.addEducation),
                ],
              ),
            );
          }),
          AppSpacing.heightMd,

          // 6. Hard Skills
          Obx(() {
            final list = controller.resumeData.value.hardSkills;
            return CollapsibleSection(
              title: 'hard_skills'.tr,
              subtitle: 'Technical skills and knowledge directly related to the job.',
              child: Column(
                children: [
                  ...list.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final skill = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          _buildResponsiveRow(
                            isMobile: isMobile,
                            child1: TextFormField(
                              initialValue: skill.name,
                              decoration: const InputDecoration(hintText: 'Skill name'),
                              onChanged: (val) => controller.updateHardSkill(idx, skill.copyWith(name: val)),
                            ),
                            child2: Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: skill.level,
                                    items: ['Beginner', 'Intermediate', 'Advanced', 'Expert']
                                        .map((lvl) => DropdownMenuItem(value: lvl, child: Text(lvl)))
                                        .toList(),
                                    onChanged: (val) {
                                      if (val != null) {
                                        controller.updateHardSkill(idx, skill.copyWith(level: val));
                                      }
                                    },
                                    decoration: const InputDecoration(hintText: 'Level'),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.grey),
                                  onPressed: () => controller.removeHardSkill(skill.id),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: skill.description,
                            decoration: const InputDecoration(hintText: 'Description (e.g., * Fluent in X...)'),
                            onChanged: (val) => controller.updateHardSkill(idx, skill.copyWith(description: val)),
                          ),
                        ],
                      ),
                    );
                  }),
                  _buildAddButton('Add hard skill', controller.addHardSkill),
                ],
              ),
            );
          }),
          AppSpacing.heightMd,

          // 7. Soft Skills
          Obx(() {
            final list = controller.resumeData.value.softSkills;
            return CollapsibleSection(
              title: 'soft_skills'.tr,
              subtitle: 'Interpersonal skills like communication, leadership, etc.',
              child: Column(
                children: [
                  ...list.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final skill = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          _buildResponsiveRow(
                            isMobile: isMobile,
                            child1: TextFormField(
                              initialValue: skill.name,
                              decoration: const InputDecoration(hintText: 'Skill name'),
                              onChanged: (val) => controller.updateSoftSkill(idx, skill.copyWith(name: val)),
                            ),
                            child2: Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: skill.level,
                                    items: ['Beginner', 'Intermediate', 'Advanced', 'Expert']
                                        .map((lvl) => DropdownMenuItem(value: lvl, child: Text(lvl)))
                                        .toList(),
                                    onChanged: (val) {
                                      if (val != null) {
                                        controller.updateSoftSkill(idx, skill.copyWith(level: val));
                                      }
                                    },
                                    decoration: const InputDecoration(hintText: 'Level'),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.grey),
                                  onPressed: () => controller.removeSoftSkill(skill.id),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: skill.description,
                            decoration: const InputDecoration(hintText: 'Description (e.g., * Strong communication...)'),
                            onChanged: (val) => controller.updateSoftSkill(idx, skill.copyWith(description: val)),
                          ),
                        ],
                      ),
                    );
                  }),
                  _buildAddButton('Add soft skill', controller.addSoftSkill),
                ],
              ),
            );
          }),
          AppSpacing.heightMd,

          // 8. Languages
          Obx(() {
            final list = controller.resumeData.value.languages;
            return CollapsibleSection(
              title: 'languages'.tr,
              subtitle: 'List languages you speak and your proficiency level.',
              child: Column(
                children: [
                  ...list.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final lang = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildResponsiveRow(
                        isMobile: isMobile,
                        child1: TextFormField(
                          initialValue: lang.name,
                          decoration: const InputDecoration(hintText: 'Language (e.g., English)'),
                          onChanged: (val) => controller.updateLanguage(idx, lang.copyWith(name: val)),
                        ),
                        child2: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: lang.level,
                                decoration: const InputDecoration(hintText: 'Level (e.g., Native)'),
                                onChanged: (val) => controller.updateLanguage(idx, lang.copyWith(level: val)),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.grey),
                              onPressed: () => controller.removeLanguage(lang.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  _buildAddButton('Add language', controller.addLanguage),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildResponsiveRow({required bool isMobile, required Widget child1, required Widget child2}) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          child1,
          const SizedBox(height: 16),
          child2,
        ],
      );
    }
    return Row(
      children: [
        Expanded(child: child1),
        const SizedBox(width: 24),
        Expanded(child: child2),
      ],
    );
  }

  Widget _spacer(bool isMobile) {
    return SizedBox(height: isMobile ? 16 : 24);
  }

  Widget _buildField(String label, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }

  Widget _buildAddButton(String label, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        icon: const Icon(Icons.add, size: 16, color: Colors.blue),
        label: Text(label, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14)),
        onPressed: onPressed,
      ),
    );
  }

  Widget _toolbarButton(String text, {bool bold = false, bool italic = false, bool underline = false, bool strikethrough = false}) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          decoration: TextDecoration.combine([
            if (underline) TextDecoration.underline,
            if (strikethrough) TextDecoration.lineThrough,
          ]),
          color: const Color(0xFF334155),
        ),
      ),
    );
  }
}

// Reusable Collapsible Card mirroring Vue accordion styles (Stateful to preserve expansion state across rebuilds)
class CollapsibleSection extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget child;

  const CollapsibleSection({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
  });

  @override
  State<CollapsibleSection> createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                        ),
                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.subtitle!,
                            style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: const Color(0xFF94A3B8),
                  ),
                ],
              ),
            ),
          ),
          if (_isExpanded) ...[
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            Padding(
              padding: const EdgeInsets.all(24),
              child: widget.child,
            ),
          ],
        ],
      ),
    );
  }
}
