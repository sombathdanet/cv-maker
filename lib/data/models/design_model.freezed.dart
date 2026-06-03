// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PageMargins _$PageMarginsFromJson(Map<String, dynamic> json) {
  return _PageMargins.fromJson(json);
}

/// @nodoc
mixin _$PageMargins {
  int get top => throw _privateConstructorUsedError;
  int get right => throw _privateConstructorUsedError;
  int get bottom => throw _privateConstructorUsedError;
  int get left => throw _privateConstructorUsedError;

  /// Serializes this PageMargins to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageMargins
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageMarginsCopyWith<PageMargins> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageMarginsCopyWith<$Res> {
  factory $PageMarginsCopyWith(
    PageMargins value,
    $Res Function(PageMargins) then,
  ) = _$PageMarginsCopyWithImpl<$Res, PageMargins>;
  @useResult
  $Res call({int top, int right, int bottom, int left});
}

/// @nodoc
class _$PageMarginsCopyWithImpl<$Res, $Val extends PageMargins>
    implements $PageMarginsCopyWith<$Res> {
  _$PageMarginsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageMargins
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? right = null,
    Object? bottom = null,
    Object? left = null,
  }) {
    return _then(
      _value.copyWith(
            top: null == top
                ? _value.top
                : top // ignore: cast_nullable_to_non_nullable
                      as int,
            right: null == right
                ? _value.right
                : right // ignore: cast_nullable_to_non_nullable
                      as int,
            bottom: null == bottom
                ? _value.bottom
                : bottom // ignore: cast_nullable_to_non_nullable
                      as int,
            left: null == left
                ? _value.left
                : left // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PageMarginsImplCopyWith<$Res>
    implements $PageMarginsCopyWith<$Res> {
  factory _$$PageMarginsImplCopyWith(
    _$PageMarginsImpl value,
    $Res Function(_$PageMarginsImpl) then,
  ) = __$$PageMarginsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int top, int right, int bottom, int left});
}

/// @nodoc
class __$$PageMarginsImplCopyWithImpl<$Res>
    extends _$PageMarginsCopyWithImpl<$Res, _$PageMarginsImpl>
    implements _$$PageMarginsImplCopyWith<$Res> {
  __$$PageMarginsImplCopyWithImpl(
    _$PageMarginsImpl _value,
    $Res Function(_$PageMarginsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PageMargins
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top = null,
    Object? right = null,
    Object? bottom = null,
    Object? left = null,
  }) {
    return _then(
      _$PageMarginsImpl(
        top: null == top
            ? _value.top
            : top // ignore: cast_nullable_to_non_nullable
                  as int,
        right: null == right
            ? _value.right
            : right // ignore: cast_nullable_to_non_nullable
                  as int,
        bottom: null == bottom
            ? _value.bottom
            : bottom // ignore: cast_nullable_to_non_nullable
                  as int,
        left: null == left
            ? _value.left
            : left // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PageMarginsImpl implements _PageMargins {
  const _$PageMarginsImpl({
    this.top = 20,
    this.right = 20,
    this.bottom = 20,
    this.left = 20,
  });

  factory _$PageMarginsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageMarginsImplFromJson(json);

  @override
  @JsonKey()
  final int top;
  @override
  @JsonKey()
  final int right;
  @override
  @JsonKey()
  final int bottom;
  @override
  @JsonKey()
  final int left;

  @override
  String toString() {
    return 'PageMargins(top: $top, right: $right, bottom: $bottom, left: $left)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageMarginsImpl &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.right, right) || other.right == right) &&
            (identical(other.bottom, bottom) || other.bottom == bottom) &&
            (identical(other.left, left) || other.left == left));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, top, right, bottom, left);

  /// Create a copy of PageMargins
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageMarginsImplCopyWith<_$PageMarginsImpl> get copyWith =>
      __$$PageMarginsImplCopyWithImpl<_$PageMarginsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageMarginsImplToJson(this);
  }
}

abstract class _PageMargins implements PageMargins {
  const factory _PageMargins({
    final int top,
    final int right,
    final int bottom,
    final int left,
  }) = _$PageMarginsImpl;

  factory _PageMargins.fromJson(Map<String, dynamic> json) =
      _$PageMarginsImpl.fromJson;

  @override
  int get top;
  @override
  int get right;
  @override
  int get bottom;
  @override
  int get left;

  /// Create a copy of PageMargins
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageMarginsImplCopyWith<_$PageMarginsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DesignState _$DesignStateFromJson(Map<String, dynamic> json) {
  return _DesignState.fromJson(json);
}

/// @nodoc
mixin _$DesignState {
  String get template => throw _privateConstructorUsedError;
  String get accentColor => throw _privateConstructorUsedError;
  String get font => throw _privateConstructorUsedError;
  int get fontSize => throw _privateConstructorUsedError;
  double get lineHeight => throw _privateConstructorUsedError;
  PageMargins get margins => throw _privateConstructorUsedError;

  /// Serializes this DesignState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DesignState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DesignStateCopyWith<DesignState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignStateCopyWith<$Res> {
  factory $DesignStateCopyWith(
    DesignState value,
    $Res Function(DesignState) then,
  ) = _$DesignStateCopyWithImpl<$Res, DesignState>;
  @useResult
  $Res call({
    String template,
    String accentColor,
    String font,
    int fontSize,
    double lineHeight,
    PageMargins margins,
  });

  $PageMarginsCopyWith<$Res> get margins;
}

/// @nodoc
class _$DesignStateCopyWithImpl<$Res, $Val extends DesignState>
    implements $DesignStateCopyWith<$Res> {
  _$DesignStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DesignState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
    Object? accentColor = null,
    Object? font = null,
    Object? fontSize = null,
    Object? lineHeight = null,
    Object? margins = null,
  }) {
    return _then(
      _value.copyWith(
            template: null == template
                ? _value.template
                : template // ignore: cast_nullable_to_non_nullable
                      as String,
            accentColor: null == accentColor
                ? _value.accentColor
                : accentColor // ignore: cast_nullable_to_non_nullable
                      as String,
            font: null == font
                ? _value.font
                : font // ignore: cast_nullable_to_non_nullable
                      as String,
            fontSize: null == fontSize
                ? _value.fontSize
                : fontSize // ignore: cast_nullable_to_non_nullable
                      as int,
            lineHeight: null == lineHeight
                ? _value.lineHeight
                : lineHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            margins: null == margins
                ? _value.margins
                : margins // ignore: cast_nullable_to_non_nullable
                      as PageMargins,
          )
          as $Val,
    );
  }

  /// Create a copy of DesignState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageMarginsCopyWith<$Res> get margins {
    return $PageMarginsCopyWith<$Res>(_value.margins, (value) {
      return _then(_value.copyWith(margins: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DesignStateImplCopyWith<$Res>
    implements $DesignStateCopyWith<$Res> {
  factory _$$DesignStateImplCopyWith(
    _$DesignStateImpl value,
    $Res Function(_$DesignStateImpl) then,
  ) = __$$DesignStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String template,
    String accentColor,
    String font,
    int fontSize,
    double lineHeight,
    PageMargins margins,
  });

  @override
  $PageMarginsCopyWith<$Res> get margins;
}

/// @nodoc
class __$$DesignStateImplCopyWithImpl<$Res>
    extends _$DesignStateCopyWithImpl<$Res, _$DesignStateImpl>
    implements _$$DesignStateImplCopyWith<$Res> {
  __$$DesignStateImplCopyWithImpl(
    _$DesignStateImpl _value,
    $Res Function(_$DesignStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DesignState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
    Object? accentColor = null,
    Object? font = null,
    Object? fontSize = null,
    Object? lineHeight = null,
    Object? margins = null,
  }) {
    return _then(
      _$DesignStateImpl(
        template: null == template
            ? _value.template
            : template // ignore: cast_nullable_to_non_nullable
                  as String,
        accentColor: null == accentColor
            ? _value.accentColor
            : accentColor // ignore: cast_nullable_to_non_nullable
                  as String,
        font: null == font
            ? _value.font
            : font // ignore: cast_nullable_to_non_nullable
                  as String,
        fontSize: null == fontSize
            ? _value.fontSize
            : fontSize // ignore: cast_nullable_to_non_nullable
                  as int,
        lineHeight: null == lineHeight
            ? _value.lineHeight
            : lineHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        margins: null == margins
            ? _value.margins
            : margins // ignore: cast_nullable_to_non_nullable
                  as PageMargins,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DesignStateImpl implements _DesignState {
  const _$DesignStateImpl({
    this.template = 'modern',
    this.accentColor = '#0f3460',
    this.font = 'Inter',
    this.fontSize = 12,
    this.lineHeight = 1.5,
    this.margins = const PageMargins(),
  });

  factory _$DesignStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DesignStateImplFromJson(json);

  @override
  @JsonKey()
  final String template;
  @override
  @JsonKey()
  final String accentColor;
  @override
  @JsonKey()
  final String font;
  @override
  @JsonKey()
  final int fontSize;
  @override
  @JsonKey()
  final double lineHeight;
  @override
  @JsonKey()
  final PageMargins margins;

  @override
  String toString() {
    return 'DesignState(template: $template, accentColor: $accentColor, font: $font, fontSize: $fontSize, lineHeight: $lineHeight, margins: $margins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesignStateImpl &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.accentColor, accentColor) ||
                other.accentColor == accentColor) &&
            (identical(other.font, font) || other.font == font) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.lineHeight, lineHeight) ||
                other.lineHeight == lineHeight) &&
            (identical(other.margins, margins) || other.margins == margins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    template,
    accentColor,
    font,
    fontSize,
    lineHeight,
    margins,
  );

  /// Create a copy of DesignState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DesignStateImplCopyWith<_$DesignStateImpl> get copyWith =>
      __$$DesignStateImplCopyWithImpl<_$DesignStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DesignStateImplToJson(this);
  }
}

abstract class _DesignState implements DesignState {
  const factory _DesignState({
    final String template,
    final String accentColor,
    final String font,
    final int fontSize,
    final double lineHeight,
    final PageMargins margins,
  }) = _$DesignStateImpl;

  factory _DesignState.fromJson(Map<String, dynamic> json) =
      _$DesignStateImpl.fromJson;

  @override
  String get template;
  @override
  String get accentColor;
  @override
  String get font;
  @override
  int get fontSize;
  @override
  double get lineHeight;
  @override
  PageMargins get margins;

  /// Create a copy of DesignState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DesignStateImplCopyWith<_$DesignStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
