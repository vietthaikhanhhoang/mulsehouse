import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/server/pmodelnews.dart';

class plistnewspage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return plistnewspageState();
  }
}

class plistnewspageState extends State<plistnewspage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void load() async {

    pmodelnews().getProduct();
    pmodelnews().fetchNews("", "");

    // ListingResponses response = ListingResponses();
    // response.code = EResponseCode.CODE_FAIL;
    // response.desc = "hihihi";
    //
    // Document document1 = Document();
    // document1.type = EContentType.CONTENT_TYPE_ARTICLES;
    // // document1.art.title = "cuoc tinh toi";
    //
    // Document document2 = Document();
    // document2.type = EContentType.CONTENT_TYPE_ARTICLES;
    // // document2.art.title = "cuoc tinh toi";
    //
    // List<Document> lInfos = [];
    // lInfos.add(document1);
    // lInfos.add(document2);
    // response.linfos.addAll(lInfos);
    //
    // print("count: " + response.linfos.length.toString());
    // ListingResponses hieuroi = ListingResponses.fromJson(response.writeToJson());
    // print("jsonResponse: " + hieuroi.linfos.length.toString());






    //pmodelnews().fetchNews("", "");
    // dynamic data = await futureListNews;
    //
    // // final parsed = jsonDecode(data).cast<Map<String, dynamic>>();
    //
    // var aa = data as Map<String , dynamic>;


    // ListingResponses response11 = ListingResponses.fromJson(jsonDecode(aa.toString()));


    //
    // // print();
    //
    // ListingResponses response = ListingResponses.fromJson(data);

    // print("lay ve roi : " + response.linfos.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IconButton(icon: Icon(Icons.ac_unit), onPressed: () {
        load();
      },),
    );
  }

}