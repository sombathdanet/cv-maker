import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_model.freezed.dart';
part 'design_model.g.dart';

@freezed
class PageMargins with _$PageMargins {
  const factory PageMargins({
    @Default(20) int top,
    @Default(20) int right,
    @Default(20) int bottom,
    @Default(20) int left,
  }) = _PageMargins;

  factory PageMargins.fromJson(Map<String, dynamic> json) => _$PageMarginsFromJson(json);
}

@freezed
class DesignState with _$DesignState {
  const factory DesignState({
    @Default('modern') String template,
    @Default('#0f3460') String accentColor,
    @Default('Inter') String font,
    @Default(12) int fontSize,
    @Default(1.5) double lineHeight,
    @Default(PageMargins()) PageMargins margins,
  }) = _DesignState;

  factory DesignState.fromJson(Map<String, dynamic> json) => _$DesignStateFromJson(json);
}
