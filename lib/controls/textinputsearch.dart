import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef StringValue = void Function(String);

class textInputSearch extends StatefulWidget {
  StringValue callback;
  bool isNightMode = false;
  textInputSearch(this.callback, this.isNightMode);

  @override
  State<StatefulWidget> createState() {
    return textInputSearchState();
  }
}

class textInputSearchState extends State<textInputSearch> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    //print('Second text field: ${myController.text}');
    widget.callback(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextField(
        controller: myController,
        maxLines: 1,
        style: TextStyle(fontSize: 20,
            color: widget.isNightMode == true ? Colors.white : Colors.black
        ),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: widget.isNightMode == true ? Colors.white : Colors.black),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, -16.0, 10.0),
          prefixIcon: Icon(Icons.search),
          suffixIcon: myController.text.length > 0
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    myController.text = "";
                    widget.callback(myController.text);
                  },
                )
              : null,
          hintText: "Nhập tìm kiếm ...",
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(
                color: widget.isNightMode == true ? Colors.white : Colors.grey,
                width: 1.0),
          ),
        ),
      ),
    );
  }
}
