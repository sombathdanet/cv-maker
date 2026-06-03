import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_model.freezed.dart';
part 'resume_model.g.dart';

@freezed
class PersonalInfo with _$PersonalInfo {
  const factory PersonalInfo({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String location,
    @Default('') String title,
    @Default('') String summary,
    @Default('') String linkedin,
    @Default('') String website,
    @Default('') String photo, // Base64 profile photo representation
    String? gender,
    String? dateOfBirth,
    String? placeOfBirth,
    String? nationality,
    String? maritalStatus,
    String? height,
    String? weight,
    String? applyFor,
  }) = _PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => _$PersonalInfoFromJson(json);
}

@freezed
class Education with _$Education {
  const factory Education({
    required String id,
    @Default('') String school,
    @Default('') String degree,
    @Default('') String field,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default('') String description,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String id,
    @Default('') String company,
    @Default('') String position,
    @Default('') String location,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default(false) bool current,
    @Default('') String description,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);
}

@freezed
class Skill with _$Skill {
  const factory Skill({
    required String id,
    @Default('') String name,
    @Default('Intermediate') String level,
    String? description,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}

@freezed
class Language with _$Language {
  const factory Language({
    required String id,
    @Default('') String name,
    @Default('Native') String level,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}

@freezed
class ResumeData with _$ResumeData {
  const factory ResumeData({
    required PersonalInfo personalInfo,
    @Default([]) List<Education> education,
    @Default([]) List<Experience> experience,
    @Default([]) List<Skill> hardSkills,
    @Default([]) List<Skill> softSkills,
    @Default([]) List<Language> languages,
  }) = _ResumeData;

  factory ResumeData.fromJson(Map<String, dynamic> json) => _$ResumeDataFromJson(json);
}
