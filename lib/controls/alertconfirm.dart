import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum optionAlert {
  ok,
  cancel,
}

typedef StringValue = void Function(optionAlert);
class alertconfirm extends StatefulWidget{
  StringValue callback;
  String title;
  String textCancel, textOk;

  alertconfirm(this.title, this.textCancel, this.textOk, this.callback);

  @override
  State<StatefulWidget> createState() {
    return alertconfirmState();
  }
}

class alertconfirmState extends State<alertconfirm>{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      actions: [
        FlatButton(
          child: Text(widget.textCancel),
          onPressed: () {
            Navigator.of(context).pop();
            widget.callback(optionAlert.cancel);
          },
        ),
        FlatButton(
          child: Text(widget.textOk),
          onPressed: () {
            Navigator.of(context).pop();
            widget.callback(optionAlert.ok);
          },
        )
    ],
    );
  }
}