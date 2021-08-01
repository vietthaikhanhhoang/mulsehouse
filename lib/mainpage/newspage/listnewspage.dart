import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/cell/newsbigcell.dart';
import 'package:mulsehouse/cell/newscell.dart';
import 'package:mulsehouse/server/modelnews.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class listnewspage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return listnewspageState();
  }
}

class listnewspageState extends State<listnewspage> {
  List<dynamic> listNews = [];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void load() async {
    Future<dynamic> futureListNews = modelnews().fetchNews("", "");
    dynamic data = await futureListNews;

    List<dynamic> listData = [];
    if(data["linfos"] != null) {
      List<dynamic> linfos = data["linfos"];
      print("aaaa: " + linfos.length.toString());
      for(int i=0;i<linfos.length;i++) {
        dynamic item = linfos[i];
        if(item["type"] == 1){
          if(item["Doc"] != null){
            if(item["Doc"]["Art"] != null) {
              listData.add(item["Doc"]["Art"]);
            }
          }
        }
      }
    }

    setState(() {
      listNews = listData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load();
  }

  void _onRefresh() async {
    print("goi refresh");
    listNews.clear();
    load();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("goi onloading");
    loadMore();
    _refreshController.loadComplete();
  }

  void loadMore() async {
    print("load more news");
    String lid = listNews.last["lid"];
    Future<dynamic> futureListNews = modelnews().fetchNews(lid, listNews.length.toString());
    dynamic data = await futureListNews;

    List<dynamic> listData = [];
    if(data["linfos"] != null) {
      List<dynamic> linfos = data["linfos"];
      for(int i=0;i<linfos.length;i++) {
        dynamic item = linfos[i];
        if(item["type"] == 1){
          if(item["Doc"] != null){
            if(item["Doc"]["Art"] != null) {
              listData.add(item["Doc"]["Art"]);
            }
          }
        }
      }
    }

    print("them " + listData.length.toString());

    setState(() {
      listNews.addAll(listData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tin nóng")),
      body: SmartRefresher(
        controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,

          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
        child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: listNews.length,
            itemBuilder: (c, i) => getNewsCell(listNews[i])
        )
      )
    );
  }

  Widget getNewsCell(dynamic news) {
    Random random = new Random();
    int randomNumber = random.nextInt(2);
    return randomNumber == 0 ? newscell(news, false) : newsbigcell(news, false);
  }
}