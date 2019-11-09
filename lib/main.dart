import 'package:flutter/material.dart';
import 'package:worktracker/dialog.dart';
import 'package:worktracker/storage.dart';
import 'package:worktracker/table.dart';

void main() => runApp(WorkTracker());

class WorkTracker extends StatelessWidget {
  static const TITLE = 'Worktracker';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TITLE,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'ProductSans'),
        home: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(TITLE),
            ),
            body: TableView(WorkRecordStorage()),
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                showDialog(
                    context: context, builder: (context) => EntryDialog())
              },
              tooltip: 'New Entry',
              child: Icon(Icons.add),
            ),
          ),
        ));
  }
}
