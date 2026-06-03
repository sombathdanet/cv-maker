// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageMarginsImpl _$$PageMarginsImplFromJson(Map<String, dynamic> json) =>
    _$PageMarginsImpl(
      top: (json['top'] as num?)?.toInt() ?? 20,
      right: (json['right'] as num?)?.toInt() ?? 20,
      bottom: (json['bottom'] as num?)?.toInt() ?? 20,
      left: (json['left'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$PageMarginsImplToJson(_$PageMarginsImpl instance) =>
    <String, dynamic>{
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'left': instance.left,
    };

_$DesignStateImpl _$$DesignStateImplFromJson(Map<String, dynamic> json) =>
    _$DesignStateImpl(
      template: json['template'] as String? ?? 'modern',
      accentColor: json['accentColor'] as String? ?? '#0f3460',
      font: json['font'] as String? ?? 'Inter',
      fontSize: (json['fontSize'] as num?)?.toInt() ?? 12,
      lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 1.5,
      margins: json['margins'] == null
          ? const PageMargins()
          : PageMargins.fromJson(json['margins'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DesignStateImplToJson(_$DesignStateImpl instance) =>
    <String, dynamic>{
      'template': instance.template,
      'accentColor': instance.accentColor,
      'font': instance.font,
      'fontSize': instance.fontSize,
      'lineHeight': instance.lineHeight,
      'margins': instance.margins,
    };
