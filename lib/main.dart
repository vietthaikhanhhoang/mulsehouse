import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/mainpage/notificationpage/detailnotification.dart';
import 'package:mulsehouse/test/testHTML.dart';
import 'package:mulsehouse/test/testhome.dart';

import 'controls/alertconfirm.dart';
import 'mainpage/home.dart';
import 'mainpage/newspage/listnewspage.dart';
import 'mainpage/newspage/plistnewspage.dart';
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

// void main() {
//   runApp(MyApp());
// }

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
  bool isNightMode = false;
  int _selectedIndex = 0;

  void getAllFuture() async {
    bool _isNightMode = await global.shared.getSettingNightMode();
    setState(() {
      isNightMode = _isNightMode;
    });
  }

  void processInfoPushFromFirebase() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('onMessage');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alertconfirm(
                "Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ sơ sinh và trẻ nhỏ!Vui lòng xác nhận bạn là nhân viên y tế hoặc có nhu cầu tìm hiểu thông tin về sản phẩm theo chỉ dẫn của nhân viên y tế.",
                "Bỏ qua",
                "Đọc tin", (value) {
              if (value == optionAlert.ok) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detailnotification()));
              }
            });
          });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => detailnotification()));
    });
  }

  void initState() {
    super.initState();

    // processInfoPushFromFirebase();

    eventBus.on<eventfire>().listen((event) {
      if (event.eventName == "nightmode") {
        getAllFuture();
      }
    });

    // FirebaseMessaging messaging = FirebaseMessaging.instance;
    // messaging.getInitialMessage().then((message) => {
    //   //message.notification!.title!,
    //   //message != null
    //   //message.data["desc"] != null
    //   if (message != null) {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => detailnotification()))
    //   }
    // });
  }

  List<StatefulWidget> _widgetOptions = <StatefulWidget>[
    home(),
    search(),
    utility(),
    setting()
  ];

  void _onItemTapped(int index) {
    setState(() {
      isNightMode = global.shared.isNightMode;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: _selectedIndex == 2 ? Size.zero : Size.fromHeight(54.0),
        child: AppBar(
          title: Text("MulseHouse"),
          leading: IconButton(icon: Icon(Icons.ac_unit), onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>listnewspage())
            );
          },),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    print("${isNightMode}");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => notification(isNightMode)));
                    //  MaterialPageRoute(
                    // builder: (context) => testpage()));
                  },
                  child: Icon(Icons.notifications),
                ))
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: IndexedStack(
          children: _widgetOptions,
          index: _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print("sieu hay cua no: ${global.shared.isNightMode}");
                _onItemTapped(0);
              },
              child: Container(
                color: isNightMode == true ? Colors.black : Colors.white,
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    Text(
                      "Trang chủ",
                      style: TextStyle(
                          color: isNightMode == true
                              ? Colors.white
                              : Colors.black,
                          fontSize: _selectedIndex == 0 ? 17 : 16,
                          fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(1);
              },
              child: Container(
                color: isNightMode == true ? Colors.black : Colors.white,
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    Text(
                      "Tìm kiếm",
                      style: TextStyle(
                          color: isNightMode == true
                              ? Colors.white
                              : Colors.black,
                          fontSize: _selectedIndex == 1 ? 17 : 16,
                          fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(2);
              },
              child: Container(
                color: isNightMode == true ? Colors.black : Colors.white,
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.ac_unit),
                    Text(
                      "Tiện ích",
                      style: TextStyle(
                          color: isNightMode == true
                              ? Colors.white
                              : Colors.black,
                          fontSize: _selectedIndex == 2 ? 17 : 16,
                          fontWeight: _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _onItemTapped(3);
              },
              child: Container(
                color: isNightMode == true ? Colors.black : Colors.white,
                width: MediaQuery.of(context).size.width / 4,
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings),
                    Text(
                      "Cá nhân",
                      style: TextStyle(
                          color: isNightMode == true
                              ? Colors.white
                              : Colors.black,
                          fontSize: _selectedIndex == 3 ? 17 : 16,
                          fontWeight: _selectedIndex == 3 ? FontWeight.bold : FontWeight.normal
                      ),
                    )
                  ],
                ),
              ),
            ),
            // IconButton(icon: Icon(Icons.search), onPressed: () {_onItemTapped(1);},),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   // selectedItemColor: isNightMode == true ? Colors.white : Colors.black,
      //   // unselectedItemColor: isNightMode == true ? Colors.white : Colors.black,
      //   backgroundColor: isNightMode == true ? Colors.white : Colors.black,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Trang chủ",
      //     style: TextStyle(
      //         color: isNightMode == true ? Colors.white : Colors.black
      //     ),)),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Tìm kiếm",
      //         style: TextStyle(
      //             color: isNightMode == true ? Colors.white : Colors.black
      //         ))),
      //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("Tiện ích",
      //         style: TextStyle(
      //             color: isNightMode == true ? Colors.white : Colors.black
      //         ))),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Cá nhân",
      //         style: TextStyle(
      //             color: isNightMode == true ? Colors.white : Colors.black
      //         )))
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // )
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

////////notification
Future<void> main() async {
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Platform messages may fail, so we use a try/catch PlatformException.
  // try {
  //   deviceId = await PlatformDeviceId.getDeviceId;
  // } on PlatformException {
  //   deviceId = 'Failed_deviceId.';
  // }

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //
  // if (defaultTargetPlatform == TargetPlatform.iOS ||
  //     defaultTargetPlatform == TargetPlatform.android) {
  //   print('FlutterFire Messaging Example: Getting APNs token...');
  //
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     announcement: false,
  //     badge: true,
  //     carPlay: false,
  //     criticalAlert: false,
  //     provisional: false,
  //     sound: true,
  //   );
  //
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted permission');
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     print('User granted provisional permission');
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  //
  //   var tokenPage = await FirebaseMessaging.instance.getToken();
  //
  //   // String token = await FirebaseMessaging.instance.getToken();
  //   // String deviceID = "DeviceID fake";
  //   // String os = "ios fake";
  //   // registerTokenFirebaseToAdmin(deviceID, token, os);
  //   // print("goi xong ham dang ky token len server");
  //
  //   print('FlutterFire Messaging Example: Got token: ${tokenPage}');
  // } else {
  //   print(
  //       'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.');
  // }

  runApp(MyApp());
}
