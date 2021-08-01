import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/buildwidget/webviewpage.dart';
import 'package:mulsehouse/main.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:mulsehouse/eventbusfire/eventfire.dart';
import 'package:mulsehouse/mainpage/mailpage/mail.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'package:mulsehouse/controls/alertconfirm.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';

class setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return settingState();
  }
}

class settingState extends State<setting> with WidgetsBindingObserver {
  bool isNightMode = false;

  bool _isLoggedIn = false;
  Map _userObj = {};

  bool isEnablePush = false;

  void getAllFurture() async {
    Map _userObj = await global.shared.getLoginFacebook();
    this._userObj = _userObj;
    if (_userObj.keys.length > 0) {
      _isLoggedIn = true;
      // print("no chay luon vao : ${this._userObj}");
    }
  }

  void detectIsEnablePush() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      setState(() {
        isEnablePush = true;
      });
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
      setState(() {
        isEnablePush = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("vao man hinh setting");

    if(WidgetsBinding.instance != null){
      WidgetsBinding.instance!.addObserver(this);
    }

    setState(() {
      isNightMode = global.shared.isNightMode;
    });

    getAllFurture();
    detectIsEnablePush();
    print("vao ham init state");
  }

  @override
  void dispose() {
    super.dispose();

    if(WidgetsBinding.instance != null){
      WidgetsBinding.instance!.removeObserver(this);
    }
    print("vao ham dispose state");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        detectIsEnablePush();
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  void actionNightMode() {
    setState(() {
      isNightMode = !isNightMode;
    });
    global.shared.setSettingNightMode(isNightMode);
    eventBus.fire(eventfire('nightmode'));
  }

  ///Dang nhap fb
  void loginFacebook() async {
    FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]).then((value) {
      FacebookAuth.instance.getUserData().then((userData) {
        setState(() {
          _isLoggedIn = true;
          _userObj = userData;
          global.shared.setLoginFacebook(_userObj);

          print("userData: ${userData}");
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isNightMode == false ? Colors.white : Colors.black,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: GestureDetector(
              onTap: () {
                loginFacebook();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  _isLoggedIn
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image.network(
                              _userObj["picture"]["data"]["url"],
                              width: 80,
                              height: 80),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/facebook.png'),
                        ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    _isLoggedIn ? _userObj["name"] : "Đăng nhập",
                    style: TextStyle(
                      fontSize: 24,
                      color: isNightMode == true ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Divider(
            height: 0.5,
            color: Colors.grey,
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Text("Cài đặt ứng dụng",
                    style: TextStyle(
                      fontSize: 18,
                      color: isNightMode == true ? Colors.white : Colors.black,
                    )),
              ),
              isEnablePush == false ? Row(
                children: [
                  SizedBox(width: 8),
                  Icon(Icons.push_pin_outlined),
                  SizedBox(width: 4),
                  Text(
                    "Cho phép nhận push",
                    style: TextStyle(
                      fontSize: 16,
                      color: isNightMode == true ? Colors.white : Colors.black,
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: 0),
                      child: Switch(
                        onChanged: (bool value) {
                          enablePush();
                        },
                        value: isEnablePush,
                      ))
                ],
              ) : SizedBox(height: 0),
              Row(
                children: [
                  SizedBox(width: 8),
                  Icon(Icons.brightness_2_outlined),
                  SizedBox(width: 4),
                  Text(
                    "Chế độ ban đêm",
                    style: TextStyle(
                      fontSize: 16,
                      color: isNightMode == true ? Colors.white : Colors.black,
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: 0),
                      child: Switch(
                        onChanged: (bool value) {
                          actionNightMode();
                        },
                        value: isNightMode,
                      ))
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 8),
                  Icon(Icons.video_call_outlined),
                  SizedBox(width: 4),
                  Text(
                    "Tự động phát video",
                    style: TextStyle(
                      fontSize: 16,
                      color: isNightMode == true ? Colors.white : Colors.black,
                    ),
                  ),
                  Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: 0),
                      child: Switch(
                        onChanged: (bool value) {},
                        value: false,
                      ))
                ],
              )
            ],
          ),
          SizedBox(height: 6),
          Divider(
            height: 0.5,
            color: Colors.grey,
          ),
          SizedBox(height: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                height: 50,
                child: Text("Thông tin khác",
                    style: TextStyle(
                      fontSize: 18,
                      color: isNightMode == true ? Colors.white : Colors.black,
                    )),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 8),
                  Icon(Icons.policy_outlined),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => webviewpage(
                                    url: POLICY,
                                    title: "Điều khoản sử dụng",
                                    showHeader: true,
                                  )));
                    },
                    child: Text(
                      "Điều khoản sử dụng",
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            isNightMode == true ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  sendMail();
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>email()));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.brightness_2_outlined),
                    SizedBox(width: 4),
                    Text(
                      "Gửi phản hồi",
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            isNightMode == true ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _launchURLAPP,
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.info_outline),
                    SizedBox(width: 4),
                    Text(
                      "Phiên bản hiện tại",
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            isNightMode == true ? Colors.white : Colors.black,
                      ),
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Text(
                          "1.0.0",
                          style: TextStyle(
                            fontSize: 16,
                            color: isNightMode == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 20),
              _isLoggedIn
                  ? GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alertconfirm(
                                "Đăng xuất bạn sẽ không xem được nhiều thông tin cập nhật mới nhất. Bạn có chắc chắn?",
                                "Không",
                                "Có", (value) {
                              if (value == optionAlert.ok) {
                                FacebookAuth.instance.logOut().then((value) {
                                  setState(() {
                                    _isLoggedIn = false;
                                    _userObj = {};
                                    global.shared.setLoginFacebook(_userObj);
                                  });
                                });
                              }
                            });
                          },
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          Icon(Icons.outbond_outlined),
                          SizedBox(width: 4),
                          Text(
                            "Đăng xuất",
                            style: TextStyle(
                              fontSize: 16,
                              color: isNightMode == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    )
                  : Text("")
            ],
          )
        ],
      )),
    );
  }

  _launchURLAPP() async {
    print("vao day");
    const url = URLAPP;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> sendMail() async {
    final Email email = Email(
      body: "",
      subject: "Phản hồi app MulseHouse",
      recipients: ["vietthai8485@gmail.com"],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Gửi thành công';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  static const platform =
      const MethodChannel('flutterplugins.javatpoint.com/interaction');
  Future<void> enablePush() async {
    //AppSettings.openNotificationSettings();
    // Flutter
    print("enable push");
    try {
      print("gui thanh cong");
      final int result = await platform.invokeMethod(
          'enablepush', <String, String>{'url': "https://www.cafedev.vn"});
    } on PlatformException catch (e) {
      // Unable to open the browser
      print("gap loi mie roi: ${e}");
      print(e);
    }
  }
}
