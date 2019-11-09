import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableView extends StatefulWidget {
  @override
  TableViewState createState() => TableViewState();
}

class TableViewState extends State<TableView> {
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
    return <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(
            Text('03.11.2019'),
          ),
          DataCell(
            Text('08:00'),
          ),
          DataCell(
            Text('60m'),
          ),
          DataCell(
            Text('17:00'),
          ),
          DataCell(
            Text('8h'),
          )
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            Text('04.11.2019'),
          ),
          DataCell(
            Text('07:00'),
          ),
          DataCell(
            Text('60m'),
          ),
          DataCell(
            Text('16:00'),
          ),
          DataCell(
            Text('8h'),
          )
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(
            Text('03.11.2019'),
          ),
          DataCell(
            Text('09:00'),
          ),
          DataCell(
            Text('60m'),
          ),
          DataCell(
            Text('18:00'),
          ),
          DataCell(
            Text('8h'),
          )
        ],
      ),
    ];
  }
}
