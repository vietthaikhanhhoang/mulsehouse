import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/mainpage/detailpage/detailnews.dart';

class newscell extends StatefulWidget{
  final dynamic news;
  final bool isNightMode;

  const newscell(this.news, this.isNightMode);

  @override
  State<StatefulWidget> createState() {
    return newscellState();
  }
}

class newscellState extends State<newscell> {

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
                    child: Image.network(widget.news["cover"],
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
                      // color: Colors.green,
                      margin: EdgeInsets.only(left: 16),
                      height: 40,
                      width: MediaQuery.of(context).size.width - 120 - 16 - 16 - 16,
                      child: Text(
                        widget.news["author"] != null ? widget.news["author"] : "",
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
      ),
    );
  }

}