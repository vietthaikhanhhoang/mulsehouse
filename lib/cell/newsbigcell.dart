import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:mulsehouse/mainpage/detailpage/detailnews.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:mulsehouse/mainpage/detailpage/detailproduct.dart';

class newsbigcell extends StatefulWidget{
  final dynamic news;
  final bool isNightMode;

  const newsbigcell(this.news, this.isNightMode);

  @override
  State<StatefulWidget> createState() {
    return newsbigcellState();
  }
}

class newsbigcellState extends State<newsbigcell> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>detailnews(widget.news)));
      },
      child: Container(
        color: widget.isNightMode == true ? Colors.black : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 16),
              // color: Colors.red,
              width: MediaQuery.of(context).size.width - 16 - 16,
              child: Text(
                widget.news["title"],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.isNightMode == false ? Colors.black : Colors.white,
                ),
                maxLines: 3,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                width: MediaQuery.of(context).size.width - 32,
                height: (MediaQuery.of(context).size.width - 32)*9/16,
                child: Image.network(widget.news["cover"],
                  fit: BoxFit.cover,
                )
            ),
            Container(
              // color: Colors.green,
              margin: EdgeInsets.only(left: 16, top: 16, bottom: 16),
              width: MediaQuery.of(context).size.width - 32,
              child: Text(
                  widget.news["desc"] != null ? widget.news["desc"].toString() : "",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: widget.isNightMode == false ? Colors.black : Colors.white,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

}