import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

part 'records.g.dart';

@JsonSerializable()
class Record {
  DateTime start;
  DateTime end;
  int breakMinutes;

  Record(this.start, this.end, this.breakMinutes);

  factory Record.fromMappedJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);

  int calcTotalMinutes() {
    return this.end.difference(this.start).inMinutes - breakMinutes;
  }
}

class YearlyMappedRecord {
  int year;
  Map<int, List<Record>> recordsByMonth;

  YearlyMappedRecord(this.year, this.recordsByMonth);
}

class RecordStorage {
  final Map<int, YearlyMappedRecord> _recordsByYear = new HashMap();

  RecordStorage() {
    Map<int, List<Record>> monthlyRecords = new HashMap();
    monthlyRecords.putIfAbsent(
        11,
        () => [
              Record(DateTime(2019, 11, 11, 8, 0), DateTime(2019, 11, 11, 17, 0), 60),
              Record(DateTime(2019, 11, 12, 9, 0), DateTime(2019, 11, 12, 18, 0), 60),
              Record(DateTime(2019, 11, 13, 8, 0), DateTime(2019, 11, 13, 17, 0), 60),
              Record(DateTime(2019, 11, 14, 10, 0), DateTime(2019, 11, 14, 18, 30), 30),
              Record(DateTime(2019, 11, 15, 8, 0), DateTime(2019, 11, 15, 17, 0), 60),
            ]);
    monthlyRecords.putIfAbsent(
        12,
        () => [
              Record(DateTime(2019, 11, 11, 8, 0), DateTime(2019, 11, 11, 17, 0), 60),
              Record(DateTime(2019, 11, 12, 9, 0), DateTime(2019, 11, 12, 18, 0), 60),
              Record(DateTime(2019, 11, 13, 8, 0), DateTime(2019, 11, 13, 17, 0), 60),
              Record(DateTime(2019, 11, 14, 10, 0), DateTime(2019, 11, 14, 18, 30), 30),
              Record(DateTime(2019, 11, 15, 8, 0), DateTime(2019, 11, 15, 17, 0), 60),
            ]);

    this._recordsByYear.putIfAbsent(2019, () => YearlyMappedRecord(2019, monthlyRecords));
  }

  YearlyMappedRecord getRecordsByYear(int year) {
    return this._recordsByYear[year];
  }
}
