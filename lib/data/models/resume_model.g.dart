// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalInfoImpl _$$PersonalInfoImplFromJson(Map<String, dynamic> json) =>
    _$PersonalInfoImpl(
      fullName: json['fullName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      location: json['location'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      linkedin: json['linkedin'] as String? ?? '',
      website: json['website'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      nationality: json['nationality'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      applyFor: json['applyFor'] as String?,
    );

Map<String, dynamic> _$$PersonalInfoImplToJson(_$PersonalInfoImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'location': instance.location,
      'title': instance.title,
      'summary': instance.summary,
      'linkedin': instance.linkedin,
      'website': instance.website,
      'photo': instance.photo,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'placeOfBirth': instance.placeOfBirth,
      'nationality': instance.nationality,
      'maritalStatus': instance.maritalStatus,
      'height': instance.height,
      'weight': instance.weight,
      'applyFor': instance.applyFor,
    };

_$EducationImpl _$$EducationImplFromJson(Map<String, dynamic> json) =>
    _$EducationImpl(
      id: json['id'] as String,
      school: json['school'] as String? ?? '',
      degree: json['degree'] as String? ?? '',
      field: json['field'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$EducationImplToJson(_$EducationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school': instance.school,
      'degree': instance.degree,
      'field': instance.field,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
    };

_$ExperienceImpl _$$ExperienceImplFromJson(Map<String, dynamic> json) =>
    _$ExperienceImpl(
      id: json['id'] as String,
      company: json['company'] as String? ?? '',
      position: json['position'] as String? ?? '',
      location: json['location'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      current: json['current'] as bool? ?? false,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$ExperienceImplToJson(_$ExperienceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'position': instance.position,
      'location': instance.location,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'current': instance.current,
      'description': instance.description,
    };

_$SkillImpl _$$SkillImplFromJson(Map<String, dynamic> json) => _$SkillImpl(
  id: json['id'] as String,
  name: json['name'] as String? ?? '',
  level: json['level'] as String? ?? 'Intermediate',
  description: json['description'] as String?,
);

Map<String, dynamic> _$$SkillImplToJson(_$SkillImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'description': instance.description,
    };

_$LanguageImpl _$$LanguageImplFromJson(Map<String, dynamic> json) =>
    _$LanguageImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      level: json['level'] as String? ?? 'Native',
    );

Map<String, dynamic> _$$LanguageImplToJson(_$LanguageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
    };

_$ResumeDataImpl _$$ResumeDataImplFromJson(Map<String, dynamic> json) =>
    _$ResumeDataImpl(
      personalInfo: PersonalInfo.fromJson(
        json['personalInfo'] as Map<String, dynamic>,
      ),
      education:
          (json['education'] as List<dynamic>?)
              ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      experience:
          (json['experience'] as List<dynamic>?)
              ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hardSkills:
          (json['hardSkills'] as List<dynamic>?)
              ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      softSkills:
          (json['softSkills'] as List<dynamic>?)
              ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      languages:
          (json['languages'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ResumeDataImplToJson(_$ResumeDataImpl instance) =>
    <String, dynamic>{
      'personalInfo': instance.personalInfo,
      'education': instance.education,
      'experience': instance.experience,
      'hardSkills': instance.hardSkills,
      'softSkills': instance.softSkills,
      'languages': instance.languages,
    };
