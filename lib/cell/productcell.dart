import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:mulsehouse/utils/global.dart';

import 'package:mulsehouse/mainpage/detailpage/detailproduct.dart';

class productcell extends StatefulWidget{
  final Product product;
  final bool isNightMode;

  const productcell(this.product, this.isNightMode);

  @override
  State<StatefulWidget> createState() {
    return productcellState();
  }
}

// class productcellState extends State<productcell>{
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(left: 16, top: 16),
//                 child: Image.network(
//                   "https://i1-thethao.vnecdn.net/2021/07/04/screenshot-2021-07-04-at-02-07-1150-5986-1625345689.png?w=220&h=132&q=100&dpr=2&fit=crop&s=vqZW-d-iJpBZXW-jhsEP4g",
//                   width: 70,
//                   height: 70,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Container(
//                   margin: EdgeInsets.only(left: 16, top: 16),
//                   width: MediaQuery.of(context).size.width - 70 - 16 - 16 - 16,
//                   // color: Colors.yellow,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                           "Lionel Messi lập cú đúp kiến tạo và ghi bàn ấn định chiến thắng 3-0 cho Argentina, trong trận tứ kết với Ecuador tại Copa America 2021.",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Roboto-Regular'
//                           ),
//                           maxLines: 3
//                       ),
//                       SizedBox(height: 6),
//                       Text("Thanh Niên || 3 giờ trước")
//                     ],
//                   )
//               ),
//             ],
//           ),
//           Divider(
//             color: Colors.grey,
//             indent: 0,
//             endIndent: 0,
//             thickness: 1,
//           )
//         ],
//       )
//     );
//   }
//
// }

class productcellState extends State<productcell> {

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
                    child: Image.network(widget.product.image,
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
                        widget.product.name,
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
                        widget.product.image.toString(),
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