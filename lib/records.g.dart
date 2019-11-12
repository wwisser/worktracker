// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(json['start'] == null ? null : DateTime.parse(json['start'] as String),
      json['end'] == null ? null : DateTime.parse(json['end'] as String), json['breakMinutes'] as int);
}

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'breakMinutes': instance.breakMinutes
    };
