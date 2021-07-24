import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mulsehouse/class/product.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

class testhome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return testhomeState();
  }
}

class testhomeState extends State<testhome>  with WidgetsBindingObserver {
  List<Product> listProductHorizontal = [];
  late Timer _timer;
  int _start = 0;
  var controllerListView = CarouselController();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        startTime();
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        _timer.cancel();
        break;
      case AppLifecycleState.paused:
        print("app in paused 11");
        _timer.cancel();
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  @override
  void dispose() {

    if(WidgetsBinding.instance != null){
      WidgetsBinding.instance!.removeObserver(this);
    }

    _timer.cancel();
    super.dispose();
  }

  void startTime() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      // print("xuong background co chay khong");
      _start ++;
      if(_start%5 == 0) {
        setState(() {
          controllerListView.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.linear);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(WidgetsBinding.instance != null){
      WidgetsBinding.instance!.addObserver(this);
    }

    print("man hinh 1");
    // Product product = Product(productid, name, desc, content, cateogryid, image, urlvideo)
    Product product1 = Product(1, "Bột ăn dặm Gerber Organic lúa mì yến mạch bánh quy 200g (Từ 6 tháng)", "", "", 1, "assets/img_chania.jpeg", "");
    Product product2 = Product(2, "Sữa non Goodhealth 100% Pure Colostrum 100g", "", "", 1, "assets/img_chania2.jpeg", "");
    Product product3 = Product(3, "Yến mạch Úc Primal ăn liền 200g", "", "", 1, "assets/img_chania.jpeg", "");
    Product product4 = Product(4, "Bột ăn dặm Heinz súp lơ, bông cải, phô mai 200g (Trên 6 tháng)", "", "", 1, "assets/img_chania2.jpeg", "");
    Product product5 = Product(5, "Hộp đựng thức ăn giữ nhiệt 2 chiều Nuby 450ml", "", "", 1, "assets/img_chania.jpeg", "");
    Product product6 = Product(6, "Yếm ăn silicon Everyday Baby tím nhạt", "", "", 1, "assets/img_chania2.jpeg", "");
    setState(() {
      listProductHorizontal.add(product1);
      listProductHorizontal.add(product2);
      listProductHorizontal.add(product3);
      listProductHorizontal.add(product4);
      listProductHorizontal.add(product5);
      listProductHorizontal.add(product6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            height: (MediaQuery.of(context).size.width - 32) * 9/16,
            child: CarouselSlider.builder(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                ),
                carouselController: controllerListView,
                itemCount: listProductHorizontal.length,
                itemBuilder: (c, i, realIdx) => Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    alignment: Alignment.bottomLeft,
                    height: (MediaQuery.of(context).size.width - 32) * 9/16,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(listProductHorizontal[i].image),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Text(listProductHorizontal[i].name,
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ),
                )
            ),
          ),
          RaisedButton(child: Text("Start"), onPressed: (){
            startTime();
          }),
          Text("aaaa ${_start}")
        ],
      ),
    );
  }
}