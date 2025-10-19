// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
      defaultTone: json['default_tone'] as String,
      defaultAnalyzeMode: json['default_analyze_mode'] as String,
      streaming: json['streaming'] as bool,
      saveHistory: json['save_history'] as bool,
      safeMode: json['safe_mode'] as bool,
    );

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'default_tone': instance.defaultTone,
      'default_analyze_mode': instance.defaultAnalyzeMode,
      'streaming': instance.streaming,
      'save_history': instance.saveHistory,
      'safe_mode': instance.safeMode,
    };
