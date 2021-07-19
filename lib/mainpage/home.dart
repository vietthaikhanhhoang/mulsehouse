import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/cell/productcell.dart';
import 'package:mulsehouse/cell/productbigcell.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:mulsehouse/server/modelproduct.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:mulsehouse/main.dart';
import 'package:mulsehouse/eventbusfire/eventfire.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<home> {
  bool isNightMode = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late List<Product> listProduct = [];

  void getAllFuture() async{
    bool _isNightMode = await global.shared.getSettingNightMode();
    setState(() {
      isNightMode = _isNightMode;
    });
  }

  void initState() {
    super.initState();
    print("vao man hinh home");

    load();

    eventBus.on<eventfire>().listen((event) {
      if(event.eventName == "nightmode") {
        getAllFuture();
      }
    });
  }

  void load() async {
    Future<List<Product>> futureListProduct = modelproduct().fetchProducts();
    List<Product> listProductLoad = await futureListProduct;
    setState(() {
      listProduct.addAll(listProductLoad);
    });
  }

  void loadMore() async {
    Future<List<Product>> futureListProduct = modelproduct().fetchProducts();
    List<Product> listProductMore = await futureListProduct;
    setState(() {
      listProduct.addAll(listProductMore);
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //     future: loadProduct(),
  //     builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
  //       if (snapshot.hasError) print(snapshot.error);
  //
  //       return snapshot.hasData
  //           ? ListViewProduct(snapshot.data!)
  //           : Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        // footer: CustomFooter(builder: (BuildContext context, LoadStatus? status) {
        //   Widget body;
        //   if (status == LoadStatus.idle) {
        //     body = Text("pull up load");
        //   } else if (status == LoadStatus.loading) {
        //     body = CupertinoActivityIndicator();
        //   } else if (status == LoadStatus.failed) {
        //     body = Text("Load Failed!Click retry!");
        //   } else if (status == LoadStatus.canLoading) {
        //     body = Text("release to load more");
        //   } else {
        //     body = Text("No more Data");
        //   }
        //   return Container(
        //     color:isNightMode ? Colors.black : Colors.white,
        //     height: 60.0,
        //     child: Center(child: body),
        //   );
        // },),
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: listProduct.length,
          itemBuilder: (c, i) => i % 3 == 0 ? productbigcell(listProduct[i], isNightMode) : productcell(listProduct[i], isNightMode),
        )
    );
  }

  void _onRefresh() async {
    print("goi refresh");
    listProduct.clear();
    load();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("goi onloading");
    loadMore();
    _refreshController.loadComplete();
  }
}
