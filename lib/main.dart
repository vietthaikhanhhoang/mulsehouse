import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/mainpage/notificationpage/detailnotification.dart';

import 'controls/alertconfirm.dart';
import 'mainpage/home.dart';
import 'mainpage/search.dart';
import 'mainpage/setting.dart';
import 'mainpage/utility.dart';
import 'utils/global.dart';
import 'package:mulsehouse/eventbusfire/eventfire.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mulsehouse/mainpage/notificationpage/notification.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mulsehouse/utils/global.dart';
EventBus eventBus = EventBus();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyNavigationBar());
  }
}

class MyNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyNavigationBarState();
  }
}

class MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("hihih"),
    );
  }
}
