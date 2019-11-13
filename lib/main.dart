import 'package:flutter/material.dart';
import 'package:worktracker/dialog.dart';
import 'package:worktracker/records.dart';
import 'package:worktracker/table.dart';
import 'package:intl/intl.dart';

void main() => runApp(WorkTracker());

class WorkTracker extends StatelessWidget {
  static const TITLE = 'Worktracker';

  final RecordStorage _recordStorage = RecordStorage();

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentYear = now.year;
    final int currentMonth = now.month;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TITLE,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'ProductSans'),
        home: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(TITLE),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.list),
                    onPressed: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                final List<ListTile> tiles = [];

                                for (int year = currentYear - 3; year <= currentYear; year++) {
                                  tiles.add(ListTile(
                                    title: Text(year.toString()),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: () => {
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) {
                                            final int currentMonth = DateTime.now().month;
                                            final List<ListTile> tiles = [];

                                            DateTime now = DateTime.now();
                                            int maxMonth = 12;

                                            if (year == currentYear) {
                                              maxMonth = currentMonth;
                                            }

                                            for (int month = 1; month <= maxMonth; month++) {
                                              List<Record> records =
                                                  this._recordStorage.getRecordsByYear(year).recordsByMonth[month];

                                              if (records == null) {
                                                records = [];
                                              }

                                              tiles.add(ListTile(
                                                title: Text(DateFormat(DateFormat.ABBR_MONTH)
                                                    .format(DateTime(now.year, month))),
                                                trailing: Icon(Icons.arrow_forward_ios),
                                                onTap: () => {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute<void>(builder: (BuildContext context) {
                                                    return Scaffold(
                                                        appBar: AppBar(
                                                          title: Text(
                                                              '${DateFormat(DateFormat.ABBR_MONTH).format(DateTime(now.year, month)).toString()} $year'),
                                                        ),
                                                        body: TableView(records));
                                                  }))
                                                },
                                              ));
                                            }

                                            final List<Widget> divided =
                                                ListTile.divideTiles(tiles: tiles, context: context).toList();

                                            return Scaffold(
                                              appBar: AppBar(
                                                title: Text('$year Monthly Records'),
                                              ),
                                              body: ListView(children: divided),
                                            );
                                          },
                                        ),
                                      )
                                    },
                                  ));
                                }

                                final List<Widget> divided =
                                    ListTile.divideTiles(tiles: tiles, context: context).toList();

                                return Scaffold(
                                  appBar: AppBar(
                                    title: Text('Yearly Records'),
                                  ),
                                  body: ListView(children: divided),
                                );
                              },
                            ),
                          )
                        }),
              ],
            ),
            body: TableView(this._recordStorage.getRecordsByYear(currentYear).recordsByMonth[currentMonth]),
            floatingActionButton: FloatingActionButton(
              onPressed: () => {showDialog(context: context, builder: (context) => EntryDialog())},
              tooltip: 'New Entry',
              child: Icon(Icons.add),
            ),
          ),
        ));
  }
}
