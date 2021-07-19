import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:mulsehouse/class/notify.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:mulsehouse/main.dart';
import 'package:mulsehouse/server/modelnotify.dart';
import 'package:mulsehouse/cell/notifycell.dart';

class notification extends StatefulWidget{
  bool isNightMode = false;
  notification(this.isNightMode);

  @override
  State<StatefulWidget> createState() {
    return notificationState();
  }
}

class notificationState extends State<notification>{
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  late List<Notify> listNotify = [];

  void getAllFuture() async{
  }

  void initState() {
    super.initState();
    load();
  }

  void load() async {
    Future<List<Notify>> futureListNotify = modelnotify().fetchNotifies();
    List<Notify> listNotifyLoad = await futureListNotify;
    setState(() {
      listNotify.addAll(listNotifyLoad);
    });
  }

  void loadMore() async {
    Future<List<Notify>> futureListNotify = modelnotify().fetchNotifies();
    List<Notify> listNotifyMore = await futureListNotify;
    setState(() {
      listNotify.addAll(listNotifyMore);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông báo"),
      ),
      body: SmartRefresher(
          footer: CustomFooter(builder: (BuildContext context, LoadStatus? status) {
            Widget body;
            if (status == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (status == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (status == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (status == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              color:widget.isNightMode ? Colors.black : Colors.white,
              height: 60.0,
              child: Center(child: body),
            );
          },),
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: listNotify.length,
            itemBuilder: (c, i) => notifycell(listNotify[i], widget.isNightMode),
          )
      ),
    );
  }

  void _onRefresh() async {
    print("goi refresh");
    listNotify.clear();
    load();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("goi onloading");
    loadMore();
    _refreshController.loadComplete();
  }
}