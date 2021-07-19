import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:mulsehouse/mainpage/detailpage/detailproduct.dart';

class productbigcell extends StatefulWidget{
  final Product product;
  final bool isNightMode;

  const productbigcell(this.product, this.isNightMode);

  @override
  State<StatefulWidget> createState() {
    return productbigcellState();
  }
}

class productbigcellState extends State<productbigcell> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>detailproduct(widget.product)));
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
                widget.product.name.toString(),
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
                child: Image.network(widget.product.image,
                  fit: BoxFit.cover,
                )
            ),
            Container(
              // color: Colors.green,
              margin: EdgeInsets.only(left: 16, top: 16, bottom: 16),
              width: MediaQuery.of(context).size.width - 32,
              child: Text(
                widget.product.image.toString(),
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