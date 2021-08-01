import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/buildwidget/webviewpage.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:mulsehouse/main.dart';
import 'package:mulsehouse/eventbusfire/eventfire.dart';

class utility extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return utilityState();
  }
}

class utilityState extends State<utility>{
  bool isNightMode = false;

  void getAllFuture() async{
    bool _isNightMode = await global.shared.getSettingNightMode();
    setState(() {
      isNightMode = _isNightMode;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("vao man hinh utility");

    eventBus.on<eventfire>().listen((event) {
      if(event.eventName == "nightmode") {
        getAllFuture();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            titleSpacing: 0,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.menu), text: "Thời tiết"),
                Tab(icon: Icon(Icons.alarm), text: "Xổ số"),
                Tab(icon: Icon(Icons.camera_alt), text: "Giá vàng")
              ],
            ),
          ),
        ),
        body: Container(
          color: isNightMode == true ? Colors.black : Colors.white,
          child: TabBarView(
            children: [
              webviewpage(url:WEATHER),
              webviewpage(url:LOTTERY),
              webviewpage(url:GOLD),
            ],
          )
        ),
      ),
    );
  }
}