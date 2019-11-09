import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class Record {
  DateTime start;
  DateTime end;
  int breakMinutes;

  Record(this.start, this.end, this.breakMinutes);

  factory Record.fromMappedJson(Map<String, dynamic> json) =>
      _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);

  int calcTotalMinutes() {
    return this.end.difference(this.start).inMinutes - breakMinutes;
  }
}
