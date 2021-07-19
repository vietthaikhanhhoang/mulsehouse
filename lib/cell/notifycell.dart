import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/class/notify.dart';
import 'package:mulsehouse/utils/global.dart';

class notifycell extends StatefulWidget{
  final Notify notify;
  final bool isNightMode;

  const notifycell(this.notify, this.isNightMode);

  @override
  State<StatefulWidget> createState() {
    return notifycellState();
  }
}

class notifycellState extends State<notifycell> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isNightMode == true ? Colors.black : Colors.white,
      height: 121 + 16 + 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 16, top: 16),
                  width: 120,
                  height: 120,
                  child: Image.network(widget.notify.image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 16),
                    // color: Colors.red,
                    height: 80,
                    width: MediaQuery.of(context).size.width - 120 - 16 - 16 - 16,
                    child: Text(
                      widget.notify.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: widget.isNightMode == false ? Colors.black : Colors.white,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    margin: EdgeInsets.only(left: 16),
                    height: 40,
                    width: MediaQuery.of(context).size.width - 120 - 16 - 16 - 16,
                    child: Text(
                      widget.notify.image.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: widget.isNightMode == false ? Colors.black : Colors.white,
                      ),
                      maxLines: 1,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.grey,
            height: 0.5,
          )
        ],
      ),
    );
  }

}