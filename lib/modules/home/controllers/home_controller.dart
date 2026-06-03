import 'dart:async';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/utils/pdf_generator.dart';
import '../../../data/models/resume_model.dart';
import '../../../data/models/design_model.dart';

class HomeController extends GetxController {
  final _storageService = Get.find<StorageService>();

  // State Variables
  final activeTab = 'edit'.obs; // 'edit' or 'design'
  final showMobilePreview = false.obs; // Toggle preview on mobile view
  final exporting = false.obs;
  final showExtendedDetails = false.obs;
  final mobileTabIndex = 0.obs;

  late Rx<ResumeData> resumeData;
  late Rx<DesignState> designState;

  Timer? _debounceSave;

  @override
  void onInit() {
    super.onInit();
    _loadState();
    
    // Auto-save watch listener (500ms debounce)
    ever(resumeData, (_) => _triggerAutosave());
    ever(designState, (_) => _triggerAutosave());

    // Sync mobileTabIndex with activeTab for responsive switching
    ever(mobileTabIndex, (int index) {
      if (index == 0 && activeTab.value != 'edit') {
        activeTab.value = 'edit';
      } else if (index == 1 && activeTab.value != 'design') {
        activeTab.value = 'design';
      }
    });

    ever(activeTab, (String tab) {
      if (tab == 'edit' && mobileTabIndex.value != 0) {
        mobileTabIndex.value = 0;
      } else if (tab == 'design' && mobileTabIndex.value != 1) {
        mobileTabIndex.value = 1;
      }
    });
  }

  void _loadState() {
    final cachedResume = _storageService.getResumeData();
    final cachedDesign = _storageService.getDesignState();

    if (cachedResume != null) {
      resumeData = ResumeData.fromJson(cachedResume).obs;
    } else {
      resumeData = const ResumeData(
        personalInfo: PersonalInfo(),
        education: [],
        experience: [],
        hardSkills: [],
        softSkills: [],
        languages: [],
      ).obs;
    }

    if (cachedDesign != null) {
      designState = DesignState.fromJson(cachedDesign).obs;
    } else {
      designState = const DesignState().obs;
    }
  }

  void _triggerAutosave() {
    _debounceSave?.cancel();
    _debounceSave = Timer(const Duration(milliseconds: 500), () {
      _storageService.saveResumeData(resumeData.value.toJson());
      _storageService.saveDesignState(designState.value.toJson());
    });
  }

  // Update Personal Info Fields
  void updatePersonalInfo(PersonalInfo info) {
    resumeData.value = resumeData.value.copyWith(personalInfo: info);
  }

  // Add / Remove repeatable fields
  void addExperience() {
    final newList = List<Experience>.from(resumeData.value.experience)
      ..add(Experience(id: DateTime.now().millisecondsSinceEpoch.toString()));
    resumeData.value = resumeData.value.copyWith(experience: newList);
  }

  void removeExperience(String id) {
    final newList = resumeData.value.experience.where((e) => e.id != id).toList();
    resumeData.value = resumeData.value.copyWith(experience: newList);
  }

  void updateExperience(int index, Experience exp) {
    final newList = List<Experience>.from(resumeData.value.experience);
    newList[index] = exp;
    resumeData.value = resumeData.value.copyWith(experience: newList);
  }

  void addEducation() {
    final newList = List<Education>.from(resumeData.value.education)
      ..add(Education(id: DateTime.now().millisecondsSinceEpoch.toString()));
    resumeData.value = resumeData.value.copyWith(education: newList);
  }

  void removeEducation(String id) {
    final newList = resumeData.value.education.where((e) => e.id != id).toList();
    resumeData.value = resumeData.value.copyWith(education: newList);
  }

  void updateEducation(int index, Education edu) {
    final newList = List<Education>.from(resumeData.value.education);
    newList[index] = edu;
    resumeData.value = resumeData.value.copyWith(education: newList);
  }

  void addHardSkill() {
    final newList = List<Skill>.from(resumeData.value.hardSkills)
      ..add(Skill(id: DateTime.now().millisecondsSinceEpoch.toString(), name: '', level: 'Intermediate'));
    resumeData.value = resumeData.value.copyWith(hardSkills: newList);
  }

  void removeHardSkill(String id) {
    final newList = resumeData.value.hardSkills.where((s) => s.id != id).toList();
    resumeData.value = resumeData.value.copyWith(hardSkills: newList);
  }

  void updateHardSkill(int index, Skill skill) {
    final newList = List<Skill>.from(resumeData.value.hardSkills);
    newList[index] = skill;
    resumeData.value = resumeData.value.copyWith(hardSkills: newList);
  }

  void addSoftSkill() {
    final newList = List<Skill>.from(resumeData.value.softSkills)
      ..add(Skill(id: DateTime.now().millisecondsSinceEpoch.toString(), name: '', level: 'Intermediate'));
    resumeData.value = resumeData.value.copyWith(softSkills: newList);
  }

  void removeSoftSkill(String id) {
    final newList = resumeData.value.softSkills.where((s) => s.id != id).toList();
    resumeData.value = resumeData.value.copyWith(softSkills: newList);
  }

  void updateSoftSkill(int index, Skill skill) {
    final newList = List<Skill>.from(resumeData.value.softSkills);
    newList[index] = skill;
    resumeData.value = resumeData.value.copyWith(softSkills: newList);
  }

  void addLanguage() {
    final newList = List<Language>.from(resumeData.value.languages)
      ..add(Language(id: DateTime.now().millisecondsSinceEpoch.toString(), name: '', level: 'Native'));
    resumeData.value = resumeData.value.copyWith(languages: newList);
  }

  void removeLanguage(String id) {
    final newList = resumeData.value.languages.where((l) => l.id != id).toList();
    resumeData.value = resumeData.value.copyWith(languages: newList);
  }

  void updateLanguage(int index, Language lang) {
    final newList = List<Language>.from(resumeData.value.languages);
    newList[index] = lang;
    resumeData.value = resumeData.value.copyWith(languages: newList);
  }

  // Update Design properties
  void updateTemplate(String templateId) {
    designState.value = designState.value.copyWith(template: templateId);
  }

  void updateAccentColor(String hexColor) {
    designState.value = designState.value.copyWith(accentColor: hexColor);
  }

  void updateFont(String fontName) {
    designState.value = designState.value.copyWith(font: fontName);
  }

  void updateMargins(PageMargins margins) {
    designState.value = designState.value.copyWith(margins: margins);
  }

  // Export PDF using print package
  Future<void> exportPdf() async {
    exporting.value = true;
    try {
      final pdfBytes = await PdfGenerator.generate(resumeData.value, designState.value);
      await Printing.layoutPdf(
        onLayout: (format) async => pdfBytes,
        name: '${resumeData.value.personalInfo.fullName.replaceAll(' ', '_')}_Resume',
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to generate PDF: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      exporting.value = false;
    }
  }

  @override
  void onClose() {
    _debounceSave?.cancel();
    super.onClose();
  }
}
