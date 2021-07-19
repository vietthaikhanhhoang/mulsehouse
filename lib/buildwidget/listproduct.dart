import 'package:flutter/material.dart';
import 'package:mulsehouse/cell/productcell.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:mulsehouse/server/modelproduct.dart';

class ListViewProduct extends StatefulWidget {
  final List<Product> listProduct;
  const ListViewProduct(this.listProduct);

  @override
  State<StatefulWidget> createState() {
    return ListViewProductState();
  }
}

class ListViewProductState extends State<ListViewProduct>{

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: ListView.builder(
  //         itemCount: listProduct.length,
  //         padding: const EdgeInsets.all(15.0),
  //         itemBuilder: (context, position) {
  //           return Column(
  //             children: [
  //               Divider(height: 5.0),
  //               ListTile(
  //                 title: Text(
  //                   '${listProduct[position].cateogryid}',
  //                   style: TextStyle(
  //                     fontSize: 22.0,
  //                     color: Colors.deepOrangeAccent,
  //                   ),
  //                 ),
  //                 subtitle: Text(
  //                   '${listProduct[position].name}',
  //                   style: new TextStyle(
  //                     fontSize: 18.0,
  //                     fontStyle: FontStyle.italic,
  //                   ),
  //                 ),
  //                 leading: Column(
  //                   children: [
  //                     CircleAvatar(
  //                       backgroundColor: Colors.blueAccent,
  //                       radius: 35.0,
  //                       child: Text(
  //                         'User ${listProduct[position].productid}',
  //                         style: TextStyle(
  //                           fontSize: 22.0,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 onTap: () => _onTapItem(context, listProduct[position]),
  //               ),
  //             ],
  //           );
  //         }),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: widget.listProduct.length,
      itemBuilder: (context, index){
        if(index == widget.listProduct.length - 1) {
            loadMore(index);
        }

        return productcell(widget.listProduct[index]!, false);
      },
    );
  }

  void _onTapItem(BuildContext context, Product post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.productid.toString() + ' - ' + post.name)));
  }

  void loadMore(int index) async{
    Future<List<Product>> listProductMore;
    listProductMore = modelproduct().fetchProducts();
    List<Product> list = await listProductMore;

    setState(() {
      widget.listProduct.addAll(list);
    });
    // print("them mot loat 1: " + listProduct.length.toString());
  }
}