import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class webviewpage extends StatefulWidget {
  String url;
  bool showHeader;
  String title;
  webviewpage(
      {required this.url,
      bool this.showHeader = false,
      String this.title = ""});

  @override
  State<StatefulWidget> createState() {
    return webviewpageState();
  }
}

class webviewpageState extends State<webviewpage>
    with AutomaticKeepAliveClientMixin<webviewpage> {
  @override
  bool get wantKeepAlive => true;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: widget.showHeader == true
            ? Size.fromHeight(AppBar().preferredSize.height)
            : Size.fromHeight(0),
        child: AppBar(
          title: Text(widget.title),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              }
          ),
          LinearProgressIndicator(
            minHeight: 3,
            color: this.progress < 1 ? Colors.blue : Colors.transparent,
            backgroundColor: Colors.transparent,
              value: this.progress
          )
        ],
      ),
    );
  }
}
