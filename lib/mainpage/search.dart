import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/cell/productcell.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:mulsehouse/controls/textinputsearch.dart';
import 'package:mulsehouse/server/modelproduct.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:mulsehouse/main.dart';
import 'package:mulsehouse/eventbusfire/eventfire.dart';

class search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return searchState();
  }
}

class searchState extends State<search>{
  late List<Product> listProduct = [];
  bool isNightMode = false;

  void getAllFuture() async{
    bool _isNightMode = await global.shared.getSettingNightMode();
    setState(() {
      isNightMode = _isNightMode;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("vao man hinh search");

    eventBus.on<eventfire>().listen((event) {
      if(event.eventName == "nightmode") {
        getAllFuture();
      }
    });
  }

  void searchKeyword(String keyword) async{
    if(keyword.length > 0) {
      Future<List<Product>> futureListProduct = modelproduct().fetchProducts();
      List<Product> listProductLoad = await futureListProduct;
      setState(() {
        listProduct.addAll(listProductLoad);
      });
    }
    else {
      setState(() {
        listProduct.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isNightMode == true ? Colors.black : Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textInputSearch((value){
              // print("lam gi voi bien value nay: ${value}");
              searchKeyword(value);
            }, isNightMode),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: listProduct.length,
                itemBuilder: (c, i) => productcell(listProduct[i], isNightMode),
              ),
            )
          ],
        ),
      ),
    );
  }
}