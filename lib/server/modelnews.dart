import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:mulsehouse/utils/global.dart';
import 'package:http/http.dart' as http;

class modelnews{
  dynamic parseNews(String responseBody) {
    Map<String, dynamic> data = jsonDecode(responseBody);
    return data;
  }

  Future<dynamic> fetchNews(String lid, String realsize) async {
    String url = "https://api.appnews24h.com/news/v2.0/articles?sid=999&count=24&cid=999&json=1";
    if(lid != "") url += "&lid=" + lid;
    if(realsize != "") url += "&realsize=" + realsize;

    final response =
    await http.get(Uri.parse(url),
      headers: <String, String>{
        'APP_ID': 'tinhay',
        'APP_VERSION': '1.0.85',
        'DEVICE_ID': '0ef50568-d402-472f-994e-bea239532a90',
        'DEVICE_MODEL': 'IPHONE',
        'TOKEN': '8cd7ac6bebe1255d96ee4353339b4641',
      },
    );
    if (response.statusCode == 200) {
      return parseNews(response.body);
    } else {
      throw Exception('Unable to fetch news from the REST API');
    }
  }
}