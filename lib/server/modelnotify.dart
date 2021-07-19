import 'dart:convert';
import 'dart:async';

import 'package:mulsehouse/class/notify.dart';
import 'package:http/http.dart' as http;
import 'package:mulsehouse/utils/global.dart';

class modelnotify{
  String getnotify(){
    print("lay ve mot dong notify");
    return "product 1";
  }

  List<Notify> parseNotifies(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Notify>((json) =>Notify.fromJson(json)).toList();
  }

  Future<List<Notify>> fetchNotifies() async {
    final response =
    await http.get(Uri.parse(URL + '/notify'));
    if (response.statusCode == 200) {
      return parseNotifies(response.body);
    } else {
      throw Exception('Unable to fetch notifies from the REST API');
    }
  }
}