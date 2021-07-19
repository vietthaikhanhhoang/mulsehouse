import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'dart:typed_data';//Uint8List
import 'dart:async';//Completer
import 'dart:io';//File


class ThumbnailRequest {
  final String video;
  final String thumbnailPath;
  final ImageFormat imageFormat;
  final int maxHeight;
  final int maxWidth;
  final int timeMs;
  final int quality;
  final String thumbnailDefault;

  const ThumbnailRequest(
      this.video,
        this.thumbnailPath,
        this.imageFormat,
        this.maxHeight,
        this.maxWidth,
        this.timeMs,
        this.quality,
        this.thumbnailDefault
      );
}

class ThumbnailResult {
  final Image image;
  final int dataSize;
  final int height;
  final int width;
  const ThumbnailResult(this.image, this.dataSize, this.height, this.width);
}

Future<ThumbnailResult> genThumbnail(ThumbnailRequest r) async {

  print("chay qua day");

  //WidgetsFlutterBinding.ensureInitialized();
  Uint8List? bytes;
  final Completer<ThumbnailResult> completer = Completer();
  if (r.thumbnailPath != "") {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
        video: r.video,
        thumbnailPath: r.thumbnailPath,
        imageFormat: r.imageFormat,
        maxHeight: r.maxHeight,
        maxWidth: r.maxWidth,
        timeMs: r.timeMs,
        quality: r.quality);

    print("thumbnail file is located: $thumbnailPath");

    final file = File(thumbnailPath!);
    bytes = file.readAsBytesSync();
  } else {
    print("case b: ${r.video}");
    print("case b: ${r.imageFormat}");
    print("case b: ${r.maxHeight}");
    print("case b: ${r.maxWidth}");
    print("case b: ${r.timeMs}");
    print("case b: ${r.quality}");

    bytes = await VideoThumbnail.thumbnailData(
        video: r.video,
        imageFormat: r.imageFormat,
        maxHeight: r.maxHeight,
        maxWidth: r.maxWidth,
        timeMs: r.timeMs,
        quality: r.quality);
  }

  print("chay xuong");

  // final bytes = await VideoThumbnail.thumbnailData(
  //   video: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  //   imageFormat: ImageFormat.PNG,
  //   maxWidth: 128,
  //   maxHeight: 100,// specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  //   quality: 25,
  // );

  print("qua bytes");

  int _imageDataSize = bytes!.length;
  print("image size: $_imageDataSize");

  final _image = Image.memory(bytes!);
  _image.image
      .resolve(ImageConfiguration())
      .addListener(ImageStreamListener((ImageInfo info, bool _) {
    completer.complete(
        ThumbnailResult(_image,
          _imageDataSize,
          info.image.height,
          info.image.width,
        )
    );
  }));
  return completer.future;
}

class genthumbimage extends StatefulWidget {
  ThumbnailRequest thumbnailRequest;

  genthumbimage(this.thumbnailRequest);

  @override
  genthumbimagestate createState() => genthumbimagestate();
}

class genthumbimagestate extends State<genthumbimage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThumbnailResult>(
      future: genThumbnail(widget.thumbnailRequest),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final _image = snapshot.data.image;
          final _width = snapshot.data.width;
          final _height = snapshot.data.height;
          final _dataSize = snapshot.data.dataSize;
          return _image;
        } else if (snapshot.hasError) {
          return Container(
            padding: EdgeInsets.all(8.0),
            // color: Colors.red,
            child: Image.network(widget.thumbnailRequest.thumbnailDefault),
          );
        } else {
          return Stack(
            alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image(
                      image: AssetImage('assets/thumbvideo.png'),
                      fit: BoxFit.cover),
                ),
                SizedBox(
                  child: CircularProgressIndicator(),
                  height: 55.0,
                  width: 55.0,
                )
        ]);
        }
      },
    );
  }
}