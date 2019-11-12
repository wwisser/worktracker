import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:worktracker/records.dart';

class TableView extends StatefulWidget {
  final RecordStorage _storage;

  TableView(this._storage);

  @override
  TableViewState createState() => TableViewState(this._storage);
}

class TableViewState extends State<TableView> {
  final RecordStorage _storage;

  TableViewState(this._storage);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: DataTable(
      columns: _getDataColumns(),
      rows: _getDataRows(),
    ));
  }

  List<DataColumn> _getDataColumns() {
    return <DataColumn>[
      DataColumn(
        label: Text('Date'),
      ),
      DataColumn(
        label: Text('Start'),
      ),
      DataColumn(
        label: Text('Break'),
      ),
      DataColumn(
        label: Text('End'),
      ),
      DataColumn(
        label: Text('Total'),
      )
    ];
  }

  List<DataRow> _getDataRows() {
    DateFormat hourFormat = DateFormat('HH:mm');

    return this
        ._storage
        .getRecordsByYear(2019)
        .recordsByMonth[11]
        .map((record) => DataRow(cells: <DataCell>[
              DataCell(
                Text(DateFormat('dd.MM.yyyy').format(record.start)),
              ),
              DataCell(
                Text(hourFormat.format(record.start)),
              ),
              DataCell(
                Text(this._formatRemainingTime(record.breakMinutes)),
              ),
              DataCell(
                Text(hourFormat.format(record.end)),
              ),
              DataCell(
                Text(this._formatRemainingTime(record.calcTotalMinutes())),
              )
            ]))
        .toList();
  }

  String _formatRemainingTime(int minutes) {
    String result = '';

    int hours = minutes ~/ 60;
    int minutesRest = minutes - (hours * 60);

    if (hours != 0) {
      result += '${hours}h';
    }

    if (minutesRest != 0) {
      result += '${minutesRest}m';
    }

    return result;
  }
}
