import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// const String URL="http://172.16.0.38:2000";
const String URL="http://192.168.55.103:2000";

const String WEATHER = "https://www.24h.com.vn/du-bao-thoi-tiet-c568.html";
const String LOTTERY = "https://xosodaiphat.com/xsmb-xo-so-mien-bac.html";
const String GOLD = "https://www.24h.com.vn/gia-vang-hom-nay-c425.html";
// const String POLICY = "http://192.168.0.102:2000/policy";
const String POLICY = "https://tintuconline.herokuapp.com/policy";
const String URLAPP = "https://tintuconline.herokuapp.com/";

class global{
  static global shared = global._init();
  bool isNightMode = false;
  Map userObj = {};

  global._init() {
    // init work here
    getNightMode();
    getAccountFB();
  }

  void getNightMode() async {
    bool isNightMode = await getSettingNightMode();
    this.isNightMode = isNightMode;
  }

  void getAccountFB() async {
    Map userObj = await getLoginFacebook();
    this.userObj = userObj;
  }

  Future<bool> getSettingNightMode() async{
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('nightmode') ?? false;
  }

  setSettingNightMode(bool flag) async{
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("nightmode", flag).then((bool success) {
      this.isNightMode = flag;
    });
  }

  ///login facebook
  Future<Map> getLoginFacebook() async{
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? encodedMap = prefs.getString('loginFB');
    if(encodedMap != null) {
      Map<String,dynamic> decodedMap = json.decode(encodedMap);
      print("lay ra: ${decodedMap}");
      return decodedMap;
    }
    return {};
  }

  setLoginFacebook(Map flag) async{
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? encodedMap = json.encode(flag);
    prefs.setString("loginFB", encodedMap).then((bool success) {
      print("da luu: ${success}");
      this.userObj = flag;
    });
  }
}