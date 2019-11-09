import 'dart:collection';

import 'package:worktracker/record.dart';

class WorkRecordStorage {
  Map<int, List<Record>> _recordsByMonth;

  WorkRecordStorage() {
    this._recordsByMonth = new HashMap();
    this._recordsByMonth.putIfAbsent(11, () => [
      Record(DateTime(2019, 11, 11, 8, 0), DateTime(2019, 11, 11, 17, 0), 60),
      Record(DateTime(2019, 11, 12, 9, 0), DateTime(2019, 11, 12, 18, 0), 60),
      Record(DateTime(2019, 11, 13, 8, 0), DateTime(2019, 11, 13, 17, 0), 60),
      Record(DateTime(2019, 11, 14, 10, 0), DateTime(2019, 11, 14, 18, 30), 30),
      Record(DateTime(2019, 11, 15, 8, 0), DateTime(2019, 11, 15, 17, 0), 60),
    ]);
  }

  List<Record> getRecords(int month) {
    return this._recordsByMonth[month];
  }

}
