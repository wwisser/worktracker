import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _dismissDialog() {
      Navigator.pop(context);
    }

    return AlertDialog(
      title: Text('Create Entry'),
      content: Container(child: Text('Form')),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              _dismissDialog();
            },
            child: Text('Cancel')),
        FlatButton(
          onPressed: () {
            _dismissDialog();
          },
          child: Text('Save'),
        )
      ],
    );
  }
}
