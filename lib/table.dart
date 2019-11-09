import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:worktracker/storage.dart';

class TableView extends StatefulWidget {
  WorkRecordStorage _storage;

  TableView(this._storage);

  @override
  TableViewState createState() => TableViewState(this._storage);
}

class TableViewState extends State<TableView> {
  WorkRecordStorage _storage;

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
        .getRecords(11)
        .map((record) => DataRow(cells: <DataCell>[
              DataCell(
                Text(DateFormat('dd.MM.yyyy').format(record.start)),
              ),
              DataCell(
                Text(hourFormat.format(record.start)),
              ),
              DataCell(
                Text('${record.breakMinutes}m'),
              ),
              DataCell(
                Text(hourFormat.format(record.end)),
              ),
              DataCell(
                Text('${record.calcTotalMinutes()}m'),
              )
            ]))
        .toList();
  }
}
