import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mulsehouse/protodart/p_whatnews.pb.dart';

import 'package:protobuf/protobuf.dart';

class pmodelnews{

  Future<dynamic> fetchNews(String lid, String realsize) async {
    String url = "http://192.168.55.101:8000/todo";

    final response =
    await http.get(Uri.parse(url),
      headers: <String, String>{
        // "Content_Type" : "application/x-protobuf"
      },
    );

    if (response.statusCode == 200) {
      whatNewsMsg data = whatNewsMsg.fromJson(json.decode(response.body.toString()));
      print("data: " + data.title); // ====> i meet this error

      return response.body.toString();
    } else {
      throw Exception('Unable to fetch news from the REST API');
    }
  }

  static const platform =
  const MethodChannel('flutterplugins.javatpoint.com/interaction');
  Future<void> getProduct() async {



    // print("getListProduct By Me");
    // try {
    //   print("gui thanh cong product");
    //   final dynamic result = await platform.invokeMethod(
    //       'getproduct', <String, String>{'url': "http://192.168.55.101:8000/todo"});
    //
    //   // print(result);
    //   //
    //   //
    //   // print(Product.fromJson(result));
    //
    //   // print("perfect 1");
    //
    //
    //
    //
    //   // whatNewsMsg data = whatNewsMsg();
    //   // data.title = "Thang Su";
    //   // var parsed = data.writeToJson();
    //   // var giaima = whatNewsMsg.fromJson(parsed);
    //   // print("xong roi: " + giaima.title);
    //
    //
    //   // var jsonData = '{"1":"hihi","2":"haha"}';
    //   // var parsedJson = jsonDecode(jsonData);
    //   // var user = Product.fromJson(parsedJson);
    //   // print('${user.name} is ${user.title}');
    //
    //   // // var jsonData = '{ "name" : "Dane", "title" : "FilledStacks"  }';
    //   // // var parsedJson = json.decode(jsonData);
    //   // // var user = Product.fromJson(parsedJson);
    //   // // print('${user.name} is ${user.title}');
    //   //
    //   // var jsonData = '{ "name" : "Dane", "alias" : "FilledStacks"  }';
    //   // var parsedJson = json.decode(jsonData);
    //   // var user = Product.fromJson(jsonData);
    //   // print('${user.name} is ${user.title}');
    //
    //
    //   // Product product = Product();
    //   // product.title = "hihi";
    //   // product.name = "haha";
    //   // String data = product.writeToJson();
    //   // print("data: " + data); //{"1":"hihi","2":"haha"}
    //   // Product pppp = Product.fromJson(data);
    //   // print("lai nhu binh thuong:" + pppp.title);
    //
    //
    // } on PlatformException catch (e) {
    //   // Unable to open the browser
    //   print("gap loi mie roi 11: ${e}");
    //   print(e);
    // }
  }
}