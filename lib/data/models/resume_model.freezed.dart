// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) {
  return _PersonalInfo.fromJson(json);
}

/// @nodoc
mixin _$PersonalInfo {
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get linkedin => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get photo =>
      throw _privateConstructorUsedError; // Base64 profile photo representation
  String? get gender => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get placeOfBirth => throw _privateConstructorUsedError;
  String? get nationality => throw _privateConstructorUsedError;
  String? get maritalStatus => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String? get applyFor => throw _privateConstructorUsedError;

  /// Serializes this PersonalInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalInfoCopyWith<PersonalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoCopyWith<$Res> {
  factory $PersonalInfoCopyWith(
    PersonalInfo value,
    $Res Function(PersonalInfo) then,
  ) = _$PersonalInfoCopyWithImpl<$Res, PersonalInfo>;
  @useResult
  $Res call({
    String fullName,
    String email,
    String phone,
    String location,
    String title,
    String summary,
    String linkedin,
    String website,
    String photo,
    String? gender,
    String? dateOfBirth,
    String? placeOfBirth,
    String? nationality,
    String? maritalStatus,
    String? height,
    String? weight,
    String? applyFor,
  });
}

/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res, $Val extends PersonalInfo>
    implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? location = null,
    Object? title = null,
    Object? summary = null,
    Object? linkedin = null,
    Object? website = null,
    Object? photo = null,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? placeOfBirth = freezed,
    Object? nationality = freezed,
    Object? maritalStatus = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? applyFor = freezed,
  }) {
    return _then(
      _value.copyWith(
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            linkedin: null == linkedin
                ? _value.linkedin
                : linkedin // ignore: cast_nullable_to_non_nullable
                      as String,
            website: null == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String,
            photo: null == photo
                ? _value.photo
                : photo // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            placeOfBirth: freezed == placeOfBirth
                ? _value.placeOfBirth
                : placeOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            nationality: freezed == nationality
                ? _value.nationality
                : nationality // ignore: cast_nullable_to_non_nullable
                      as String?,
            maritalStatus: freezed == maritalStatus
                ? _value.maritalStatus
                : maritalStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as String?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as String?,
            applyFor: freezed == applyFor
                ? _value.applyFor
                : applyFor // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonalInfoImplCopyWith<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  factory _$$PersonalInfoImplCopyWith(
    _$PersonalInfoImpl value,
    $Res Function(_$PersonalInfoImpl) then,
  ) = __$$PersonalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String fullName,
    String email,
    String phone,
    String location,
    String title,
    String summary,
    String linkedin,
    String website,
    String photo,
    String? gender,
    String? dateOfBirth,
    String? placeOfBirth,
    String? nationality,
    String? maritalStatus,
    String? height,
    String? weight,
    String? applyFor,
  });
}

/// @nodoc
class __$$PersonalInfoImplCopyWithImpl<$Res>
    extends _$PersonalInfoCopyWithImpl<$Res, _$PersonalInfoImpl>
    implements _$$PersonalInfoImplCopyWith<$Res> {
  __$$PersonalInfoImplCopyWithImpl(
    _$PersonalInfoImpl _value,
    $Res Function(_$PersonalInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? location = null,
    Object? title = null,
    Object? summary = null,
    Object? linkedin = null,
    Object? website = null,
    Object? photo = null,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? placeOfBirth = freezed,
    Object? nationality = freezed,
    Object? maritalStatus = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? applyFor = freezed,
  }) {
    return _then(
      _$PersonalInfoImpl(
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        linkedin: null == linkedin
            ? _value.linkedin
            : linkedin // ignore: cast_nullable_to_non_nullable
                  as String,
        website: null == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String,
        photo: null == photo
            ? _value.photo
            : photo // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        placeOfBirth: freezed == placeOfBirth
            ? _value.placeOfBirth
            : placeOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        nationality: freezed == nationality
            ? _value.nationality
            : nationality // ignore: cast_nullable_to_non_nullable
                  as String?,
        maritalStatus: freezed == maritalStatus
            ? _value.maritalStatus
            : maritalStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as String?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as String?,
        applyFor: freezed == applyFor
            ? _value.applyFor
            : applyFor // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalInfoImpl implements _PersonalInfo {
  const _$PersonalInfoImpl({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.location = '',
    this.title = '',
    this.summary = '',
    this.linkedin = '',
    this.website = '',
    this.photo = '',
    this.gender,
    this.dateOfBirth,
    this.placeOfBirth,
    this.nationality,
    this.maritalStatus,
    this.height,
    this.weight,
    this.applyFor,
  });

  factory _$PersonalInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalInfoImplFromJson(json);

  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String summary;
  @override
  @JsonKey()
  final String linkedin;
  @override
  @JsonKey()
  final String website;
  @override
  @JsonKey()
  final String photo;
  // Base64 profile photo representation
  @override
  final String? gender;
  @override
  final String? dateOfBirth;
  @override
  final String? placeOfBirth;
  @override
  final String? nationality;
  @override
  final String? maritalStatus;
  @override
  final String? height;
  @override
  final String? weight;
  @override
  final String? applyFor;

  @override
  String toString() {
    return 'PersonalInfo(fullName: $fullName, email: $email, phone: $phone, location: $location, title: $title, summary: $summary, linkedin: $linkedin, website: $website, photo: $photo, gender: $gender, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, nationality: $nationality, maritalStatus: $maritalStatus, height: $height, weight: $weight, applyFor: $applyFor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalInfoImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.linkedin, linkedin) ||
                other.linkedin == linkedin) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.applyFor, applyFor) ||
                other.applyFor == applyFor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    fullName,
    email,
    phone,
    location,
    title,
    summary,
    linkedin,
    website,
    photo,
    gender,
    dateOfBirth,
    placeOfBirth,
    nationality,
    maritalStatus,
    height,
    weight,
    applyFor,
  );

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalInfoImplCopyWith<_$PersonalInfoImpl> get copyWith =>
      __$$PersonalInfoImplCopyWithImpl<_$PersonalInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalInfoImplToJson(this);
  }
}

abstract class _PersonalInfo implements PersonalInfo {
  const factory _PersonalInfo({
    final String fullName,
    final String email,
    final String phone,
    final String location,
    final String title,
    final String summary,
    final String linkedin,
    final String website,
    final String photo,
    final String? gender,
    final String? dateOfBirth,
    final String? placeOfBirth,
    final String? nationality,
    final String? maritalStatus,
    final String? height,
    final String? weight,
    final String? applyFor,
  }) = _$PersonalInfoImpl;

  factory _PersonalInfo.fromJson(Map<String, dynamic> json) =
      _$PersonalInfoImpl.fromJson;

  @override
  String get fullName;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get location;
  @override
  String get title;
  @override
  String get summary;
  @override
  String get linkedin;
  @override
  String get website;
  @override
  String get photo; // Base64 profile photo representation
  @override
  String? get gender;
  @override
  String? get dateOfBirth;
  @override
  String? get placeOfBirth;
  @override
  String? get nationality;
  @override
  String? get maritalStatus;
  @override
  String? get height;
  @override
  String? get weight;
  @override
  String? get applyFor;

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalInfoImplCopyWith<_$PersonalInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  String get id => throw _privateConstructorUsedError;
  String get school => throw _privateConstructorUsedError;
  String get degree => throw _privateConstructorUsedError;
  String get field => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Education to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
  @useResult
  $Res call({
    String id,
    String school,
    String degree,
    String field,
    String startDate,
    String endDate,
    String description,
  });
}

/// @nodoc
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? school = null,
    Object? degree = null,
    Object? field = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            school: null == school
                ? _value.school
                : school // ignore: cast_nullable_to_non_nullable
                      as String,
            degree: null == degree
                ? _value.degree
                : degree // ignore: cast_nullable_to_non_nullable
                      as String,
            field: null == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EducationImplCopyWith<$Res>
    implements $EducationCopyWith<$Res> {
  factory _$$EducationImplCopyWith(
    _$EducationImpl value,
    $Res Function(_$EducationImpl) then,
  ) = __$$EducationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String school,
    String degree,
    String field,
    String startDate,
    String endDate,
    String description,
  });
}

/// @nodoc
class __$$EducationImplCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$EducationImpl>
    implements _$$EducationImplCopyWith<$Res> {
  __$$EducationImplCopyWithImpl(
    _$EducationImpl _value,
    $Res Function(_$EducationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? school = null,
    Object? degree = null,
    Object? field = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? description = null,
  }) {
    return _then(
      _$EducationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        school: null == school
            ? _value.school
            : school // ignore: cast_nullable_to_non_nullable
                  as String,
        degree: null == degree
            ? _value.degree
            : degree // ignore: cast_nullable_to_non_nullable
                  as String,
        field: null == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationImpl implements _Education {
  const _$EducationImpl({
    required this.id,
    this.school = '',
    this.degree = '',
    this.field = '',
    this.startDate = '',
    this.endDate = '',
    this.description = '',
  });

  factory _$EducationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String school;
  @override
  @JsonKey()
  final String degree;
  @override
  @JsonKey()
  final String field;
  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'Education(id: $id, school: $school, degree: $degree, field: $field, startDate: $startDate, endDate: $endDate, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    school,
    degree,
    field,
    startDate,
    endDate,
    description,
  );

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationImplCopyWith<_$EducationImpl> get copyWith =>
      __$$EducationImplCopyWithImpl<_$EducationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationImplToJson(this);
  }
}

abstract class _Education implements Education {
  const factory _Education({
    required final String id,
    final String school,
    final String degree,
    final String field,
    final String startDate,
    final String endDate,
    final String description,
  }) = _$EducationImpl;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$EducationImpl.fromJson;

  @override
  String get id;
  @override
  String get school;
  @override
  String get degree;
  @override
  String get field;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  String get description;

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EducationImplCopyWith<_$EducationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return _Experience.fromJson(json);
}

/// @nodoc
mixin _$Experience {
  String get id => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  bool get current => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperienceCopyWith<Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
    Experience value,
    $Res Function(Experience) then,
  ) = _$ExperienceCopyWithImpl<$Res, Experience>;
  @useResult
  $Res call({
    String id,
    String company,
    String position,
    String location,
    String startDate,
    String endDate,
    bool current,
    String description,
  });
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res, $Val extends Experience>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? position = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? current = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            company: null == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String,
            current: null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as bool,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExperienceImplCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$$ExperienceImplCopyWith(
    _$ExperienceImpl value,
    $Res Function(_$ExperienceImpl) then,
  ) = __$$ExperienceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String company,
    String position,
    String location,
    String startDate,
    String endDate,
    bool current,
    String description,
  });
}

/// @nodoc
class __$$ExperienceImplCopyWithImpl<$Res>
    extends _$ExperienceCopyWithImpl<$Res, _$ExperienceImpl>
    implements _$$ExperienceImplCopyWith<$Res> {
  __$$ExperienceImplCopyWithImpl(
    _$ExperienceImpl _value,
    $Res Function(_$ExperienceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? position = null,
    Object? location = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? current = null,
    Object? description = null,
  }) {
    return _then(
      _$ExperienceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        company: null == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String,
        current: null == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as bool,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceImpl implements _Experience {
  const _$ExperienceImpl({
    required this.id,
    this.company = '',
    this.position = '',
    this.location = '',
    this.startDate = '',
    this.endDate = '',
    this.current = false,
    this.description = '',
  });

  factory _$ExperienceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String company;
  @override
  @JsonKey()
  final String position;
  @override
  @JsonKey()
  final String location;
  @override
  @JsonKey()
  final String startDate;
  @override
  @JsonKey()
  final String endDate;
  @override
  @JsonKey()
  final bool current;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'Experience(id: $id, company: $company, position: $position, location: $location, startDate: $startDate, endDate: $endDate, current: $current, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    company,
    position,
    location,
    startDate,
    endDate,
    current,
    description,
  );

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceImplCopyWith<_$ExperienceImpl> get copyWith =>
      __$$ExperienceImplCopyWithImpl<_$ExperienceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperienceImplToJson(this);
  }
}

abstract class _Experience implements Experience {
  const factory _Experience({
    required final String id,
    final String company,
    final String position,
    final String location,
    final String startDate,
    final String endDate,
    final bool current,
    final String description,
  }) = _$ExperienceImpl;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$ExperienceImpl.fromJson;

  @override
  String get id;
  @override
  String get company;
  @override
  String get position;
  @override
  String get location;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  bool get current;
  @override
  String get description;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceImplCopyWith<_$ExperienceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Skill _$SkillFromJson(Map<String, dynamic> json) {
  return _Skill.fromJson(json);
}

/// @nodoc
mixin _$Skill {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this Skill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCopyWith<Skill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCopyWith<$Res> {
  factory $SkillCopyWith(Skill value, $Res Function(Skill) then) =
      _$SkillCopyWithImpl<$Res, Skill>;
  @useResult
  $Res call({String id, String name, String level, String? description});
}

/// @nodoc
class _$SkillCopyWithImpl<$Res, $Val extends Skill>
    implements $SkillCopyWith<$Res> {
  _$SkillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? level = null,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SkillImplCopyWith<$Res> implements $SkillCopyWith<$Res> {
  factory _$$SkillImplCopyWith(
    _$SkillImpl value,
    $Res Function(_$SkillImpl) then,
  ) = __$$SkillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String level, String? description});
}

/// @nodoc
class __$$SkillImplCopyWithImpl<$Res>
    extends _$SkillCopyWithImpl<$Res, _$SkillImpl>
    implements _$$SkillImplCopyWith<$Res> {
  __$$SkillImplCopyWithImpl(
    _$SkillImpl _value,
    $Res Function(_$SkillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? level = null,
    Object? description = freezed,
  }) {
    return _then(
      _$SkillImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillImpl implements _Skill {
  const _$SkillImpl({
    required this.id,
    this.name = '',
    this.level = 'Intermediate',
    this.description,
  });

  factory _$SkillImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String level;
  @override
  final String? description;

  @override
  String toString() {
    return 'Skill(id: $id, name: $name, level: $level, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, level, description);

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillImplCopyWith<_$SkillImpl> get copyWith =>
      __$$SkillImplCopyWithImpl<_$SkillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillImplToJson(this);
  }
}

abstract class _Skill implements Skill {
  const factory _Skill({
    required final String id,
    final String name,
    final String level,
    final String? description,
  }) = _$SkillImpl;

  factory _Skill.fromJson(Map<String, dynamic> json) = _$SkillImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get level;
  @override
  String? get description;

  /// Create a copy of Skill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillImplCopyWith<_$SkillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
mixin _$Language {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;

  /// Serializes this Language to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguageCopyWith<Language> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res, Language>;
  @useResult
  $Res call({String id, String name, String level});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res, $Val extends Language>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? level = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LanguageImplCopyWith<$Res>
    implements $LanguageCopyWith<$Res> {
  factory _$$LanguageImplCopyWith(
    _$LanguageImpl value,
    $Res Function(_$LanguageImpl) then,
  ) = __$$LanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String level});
}

/// @nodoc
class __$$LanguageImplCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$LanguageImpl>
    implements _$$LanguageImplCopyWith<$Res> {
  __$$LanguageImplCopyWithImpl(
    _$LanguageImpl _value,
    $Res Function(_$LanguageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? level = null}) {
    return _then(
      _$LanguageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageImpl implements _Language {
  const _$LanguageImpl({
    required this.id,
    this.name = '',
    this.level = 'Native',
  });

  factory _$LanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String level;

  @override
  String toString() {
    return 'Language(id: $id, name: $name, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, level);

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      __$$LanguageImplCopyWithImpl<_$LanguageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageImplToJson(this);
  }
}

abstract class _Language implements Language {
  const factory _Language({
    required final String id,
    final String name,
    final String level,
  }) = _$LanguageImpl;

  factory _Language.fromJson(Map<String, dynamic> json) =
      _$LanguageImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get level;

  /// Create a copy of Language
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResumeData _$ResumeDataFromJson(Map<String, dynamic> json) {
  return _ResumeData.fromJson(json);
}

/// @nodoc
mixin _$ResumeData {
  PersonalInfo get personalInfo => throw _privateConstructorUsedError;
  List<Education> get education => throw _privateConstructorUsedError;
  List<Experience> get experience => throw _privateConstructorUsedError;
  List<Skill> get hardSkills => throw _privateConstructorUsedError;
  List<Skill> get softSkills => throw _privateConstructorUsedError;
  List<Language> get languages => throw _privateConstructorUsedError;

  /// Serializes this ResumeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResumeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResumeDataCopyWith<ResumeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResumeDataCopyWith<$Res> {
  factory $ResumeDataCopyWith(
    ResumeData value,
    $Res Function(ResumeData) then,
  ) = _$ResumeDataCopyWithImpl<$Res, ResumeData>;
  @useResult
  $Res call({
    PersonalInfo personalInfo,
    List<Education> education,
    List<Experience> experience,
    List<Skill> hardSkills,
    List<Skill> softSkills,
    List<Language> languages,
  });

  $PersonalInfoCopyWith<$Res> get personalInfo;
}

/// @nodoc
class _$ResumeDataCopyWithImpl<$Res, $Val extends ResumeData>
    implements $ResumeDataCopyWith<$Res> {
  _$ResumeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResumeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personalInfo = null,
    Object? education = null,
    Object? experience = null,
    Object? hardSkills = null,
    Object? softSkills = null,
    Object? languages = null,
  }) {
    return _then(
      _value.copyWith(
            personalInfo: null == personalInfo
                ? _value.personalInfo
                : personalInfo // ignore: cast_nullable_to_non_nullable
                      as PersonalInfo,
            education: null == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as List<Education>,
            experience: null == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as List<Experience>,
            hardSkills: null == hardSkills
                ? _value.hardSkills
                : hardSkills // ignore: cast_nullable_to_non_nullable
                      as List<Skill>,
            softSkills: null == softSkills
                ? _value.softSkills
                : softSkills // ignore: cast_nullable_to_non_nullable
                      as List<Skill>,
            languages: null == languages
                ? _value.languages
                : languages // ignore: cast_nullable_to_non_nullable
                      as List<Language>,
          )
          as $Val,
    );
  }

  /// Create a copy of ResumeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalInfoCopyWith<$Res> get personalInfo {
    return $PersonalInfoCopyWith<$Res>(_value.personalInfo, (value) {
      return _then(_value.copyWith(personalInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResumeDataImplCopyWith<$Res>
    implements $ResumeDataCopyWith<$Res> {
  factory _$$ResumeDataImplCopyWith(
    _$ResumeDataImpl value,
    $Res Function(_$ResumeDataImpl) then,
  ) = __$$ResumeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PersonalInfo personalInfo,
    List<Education> education,
    List<Experience> experience,
    List<Skill> hardSkills,
    List<Skill> softSkills,
    List<Language> languages,
  });

  @override
  $PersonalInfoCopyWith<$Res> get personalInfo;
}

/// @nodoc
class __$$ResumeDataImplCopyWithImpl<$Res>
    extends _$ResumeDataCopyWithImpl<$Res, _$ResumeDataImpl>
    implements _$$ResumeDataImplCopyWith<$Res> {
  __$$ResumeDataImplCopyWithImpl(
    _$ResumeDataImpl _value,
    $Res Function(_$ResumeDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResumeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personalInfo = null,
    Object? education = null,
    Object? experience = null,
    Object? hardSkills = null,
    Object? softSkills = null,
    Object? languages = null,
  }) {
    return _then(
      _$ResumeDataImpl(
        personalInfo: null == personalInfo
            ? _value.personalInfo
            : personalInfo // ignore: cast_nullable_to_non_nullable
                  as PersonalInfo,
        education: null == education
            ? _value._education
            : education // ignore: cast_nullable_to_non_nullable
                  as List<Education>,
        experience: null == experience
            ? _value._experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as List<Experience>,
        hardSkills: null == hardSkills
            ? _value._hardSkills
            : hardSkills // ignore: cast_nullable_to_non_nullable
                  as List<Skill>,
        softSkills: null == softSkills
            ? _value._softSkills
            : softSkills // ignore: cast_nullable_to_non_nullable
                  as List<Skill>,
        languages: null == languages
            ? _value._languages
            : languages // ignore: cast_nullable_to_non_nullable
                  as List<Language>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResumeDataImpl implements _ResumeData {
  const _$ResumeDataImpl({
    required this.personalInfo,
    final List<Education> education = const [],
    final List<Experience> experience = const [],
    final List<Skill> hardSkills = const [],
    final List<Skill> softSkills = const [],
    final List<Language> languages = const [],
  }) : _education = education,
       _experience = experience,
       _hardSkills = hardSkills,
       _softSkills = softSkills,
       _languages = languages;

  factory _$ResumeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResumeDataImplFromJson(json);

  @override
  final PersonalInfo personalInfo;
  final List<Education> _education;
  @override
  @JsonKey()
  List<Education> get education {
    if (_education is EqualUnmodifiableListView) return _education;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_education);
  }

  final List<Experience> _experience;
  @override
  @JsonKey()
  List<Experience> get experience {
    if (_experience is EqualUnmodifiableListView) return _experience;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experience);
  }

  final List<Skill> _hardSkills;
  @override
  @JsonKey()
  List<Skill> get hardSkills {
    if (_hardSkills is EqualUnmodifiableListView) return _hardSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hardSkills);
  }

  final List<Skill> _softSkills;
  @override
  @JsonKey()
  List<Skill> get softSkills {
    if (_softSkills is EqualUnmodifiableListView) return _softSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_softSkills);
  }

  final List<Language> _languages;
  @override
  @JsonKey()
  List<Language> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  String toString() {
    return 'ResumeData(personalInfo: $personalInfo, education: $education, experience: $experience, hardSkills: $hardSkills, softSkills: $softSkills, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeDataImpl &&
            (identical(other.personalInfo, personalInfo) ||
                other.personalInfo == personalInfo) &&
            const DeepCollectionEquality().equals(
              other._education,
              _education,
            ) &&
            const DeepCollectionEquality().equals(
              other._experience,
              _experience,
            ) &&
            const DeepCollectionEquality().equals(
              other._hardSkills,
              _hardSkills,
            ) &&
            const DeepCollectionEquality().equals(
              other._softSkills,
              _softSkills,
            ) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    personalInfo,
    const DeepCollectionEquality().hash(_education),
    const DeepCollectionEquality().hash(_experience),
    const DeepCollectionEquality().hash(_hardSkills),
    const DeepCollectionEquality().hash(_softSkills),
    const DeepCollectionEquality().hash(_languages),
  );

  /// Create a copy of ResumeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeDataImplCopyWith<_$ResumeDataImpl> get copyWith =>
      __$$ResumeDataImplCopyWithImpl<_$ResumeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResumeDataImplToJson(this);
  }
}

abstract class _ResumeData implements ResumeData {
  const factory _ResumeData({
    required final PersonalInfo personalInfo,
    final List<Education> education,
    final List<Experience> experience,
    final List<Skill> hardSkills,
    final List<Skill> softSkills,
    final List<Language> languages,
  }) = _$ResumeDataImpl;

  factory _ResumeData.fromJson(Map<String, dynamic> json) =
      _$ResumeDataImpl.fromJson;

  @override
  PersonalInfo get personalInfo;
  @override
  List<Education> get education;
  @override
  List<Experience> get experience;
  @override
  List<Skill> get hardSkills;
  @override
  List<Skill> get softSkills;
  @override
  List<Language> get languages;

  /// Create a copy of ResumeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResumeDataImplCopyWith<_$ResumeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
