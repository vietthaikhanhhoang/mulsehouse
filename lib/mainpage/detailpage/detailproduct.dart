import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mulsehouse/class/product.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'package:mulsehouse/buildwidget/genthumbimage.dart';
import 'package:mulsehouse/utils/global.dart';
import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';

class detailproduct extends StatefulWidget {
  final Product productInfo;

  const detailproduct(this.productInfo);

  @override
  State<StatefulWidget> createState() {
    return detailproductState();
  }
}

class detailproductState extends State<detailproduct> {
  genthumbimage? _futreImage;
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  double positionVideo = 0;
  double volume = 1;

  bool isHiddenControl = true;
  bool isFullScreen = false;

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  void initialVideoPlayer() async {
    videoPlayerController = VideoPlayerController.network(
      widget.productInfo.urlvideo,
    );

    await videoPlayerController.initialize();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));

    initialVideoPlayer();

    ThumbnailRequest thumbRequest = ThumbnailRequest(
        widget.productInfo.urlvideo,
        "",
        ImageFormat.JPEG,
        500,
        500,
        1,
        100,
        widget.productInfo.image);

    setState(() {
      _futreImage = genthumbimage(thumbRequest);
    });
  }

  Widget widgetVideo(){
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width - 32,
      height: MediaQuery.of(context).size.width * 9/16,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            child: _futreImage,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: videocontroller(),
          ),
          // videoPlayerController.value.isPlaying ? SizedBox(height: 0) : Container(
          //   width: 50,
          //   height: 50,
          //   child: IgnorePointer(
          //     child: Image(image: AssetImage("assets/play.png")),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget videocontroller(){
    chewieController = ChewieController(
      showControls: false,
      allowFullScreen: false,
      autoPlay: false,
      videoPlayerController: videoPlayerController,

      looping: false,
      subtitleBuilder: (context, subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          subtitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(
                    // color: Colors.yellow, // Set border color
                    width: 3.0),   // Set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // Set rounded corner radius
                boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
            ),

            padding: EdgeInsets.all(16),
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
          ),
          ),
        );
      },
    );

    var playerWidget = Chewie(
      controller: chewieController,
    );

    return playerWidget;
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    //return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void playVideo() async{
    setState(() {
      if(chewieController.isPlaying){
        chewieController.pause();
      }
      else {
        chewieController.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitDown,
    // ]);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Chi tiết sản phẩm"),
    //     // toolbarHeight: 0,
    //   ),
    //   body:


      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                RotatedBox(
                  child: Container(
                    width: isFullScreen ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width,
                    height: isFullScreen ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width * 9/16,
                    // color: Colors.yellow,
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: GestureDetector(
                          onTap: (){
                            print("ahahahaha");
                            setState(() {
                              isHiddenControl = isHiddenControl == true ? false : true;
                            });
                          },
                          child: videocontroller(),
                        )
                    ),),
                  quarterTurns: isFullScreen ? 3 : 0,
                ), //video
                RotatedBox(
                  child: Container(
                    // color: Colors.grey,
                    width: MediaQuery.of(context).size.height,
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // IconButton(
                        //     icon: Icon(Icons.ad_units_sharp),
                        //     onPressed: () {
                        //       print("hihi");
                        //       setState(() {
                        //         isHiddenControl = isHiddenControl == true ? false : true;
                        //       });
                        //     }
                        // ),
                      ],
                    ),
                  ),
                  quarterTurns: isFullScreen ? 3 : 0,
                ),//top menu tren
                RotatedBox(
                  child: AnimatedPadding(
                    padding: isFullScreen ? isHiddenControl ? EdgeInsets.only(top: MediaQuery.of(context).size.width) : EdgeInsets.only(top: MediaQuery.of(context).size.width - 55) :
                    isHiddenControl ? EdgeInsets.only(top: MediaQuery.of(context).size.width)*9/16 : EdgeInsets.only(top: MediaQuery.of(context).size.width*9/16 - 55),
                    // padding: isFullScreen ? EdgeInsets.only(top: MediaQuery.of(context).size.width) : EdgeInsets.only(top: MediaQuery.of(context).size.width*9/16),
                    duration: Duration(milliseconds: 0),
                    child: Container(
                      color: Colors.grey,
                      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width - 100),
                      width: isFullScreen ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.width,
                      height: 55,
                      child: ValueListenableBuilder(
                          valueListenable: videoPlayerController,
                          builder: (context, VideoPlayerValue value, child) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: chewieController.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    onPressed: () {
                                      print("click nut play/pause");
                                      playVideo();
                                    }
                                ),
                                IconButton(
                                    icon: volume == 1 ? Icon(Icons.media_bluetooth_off) : Icon(Icons.volume_mute_outlined),
                                    onPressed: () {
                                      print("click nut mute");
                                      volume = volume == 1 ? 0 : 1;

                                      setState(() {
                                        videoPlayerController.setVolume(volume);
                                      });
                                    }
                                ),
                                Text(formatDuration(value.position) + "  " + formatDuration(value.duration)),
                                Container(
                                  width: 150,
                                  child: Slider(
                                    inactiveColor: Colors.black,
                                    activeColor: Colors.white,
                                    min: 0,
                                    max: 100,
                                    value: videoPlayerController.value.duration.inSeconds > 0 ? (videoPlayerController.value.position.inSeconds*100/videoPlayerController.value.duration.inSeconds) : 0,
                                    onChanged: (value) {
                                      videoPlayerController.seekTo(Duration(seconds: value.toInt()));
                                    },
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.aspect_ratio_sharp),
                                    onPressed: () {
                                      print("click nut phong to/thu nho: ${videoPlayerController.value.duration}");
                                      setState(() {
                                        isFullScreen = isFullScreen ? false : true;
                                      });
                                    }
                                ),
                              ],
                            );
                          }
                      ),
                    ),
                  ),
                  quarterTurns: isFullScreen ? 3 : 0,
                ),//bottom menu duoi

                isFullScreen == false ? Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 9/16),
                  child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16, top: 16),
                              child: Image.network(
                                widget.productInfo.image,
                                width: 170,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16, top: 16),
                              height: 200,
                              width: MediaQuery.of(context).size.width - 170 - 16 - 32,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Text(
                                    widget.productInfo.name,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Cung cấp dưỡng chất cho bé Bao bì nhôm phức hợp tiêu chuẩn Nhật Bản Không chất bảo quản",
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                          child: Text(
                            widget.productInfo.content,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ]
                  ),
                ) : SizedBox(height: 0,)
              ],
            ),
          ),
        ),
      );
  }
}


