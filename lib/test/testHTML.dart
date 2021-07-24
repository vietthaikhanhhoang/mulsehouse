import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:html/dom.dart' as AAAA;
import 'package:html/dom_parsing.dart' as BBBB;
import 'package:html/parser.dart' as CCCC;
import 'package:mulsehouse/class/dataHtml.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class testHTML extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return testHTMLState();
  }
}

class testHTMLState extends State<testHTML> {
  List<dataHtml> arrayContent = [];
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialVideoPlayer();

    String content = "";
    // content = "<p>Đây sẽ là loại vaccine thứ hai được sử dụng cho trẻ vị thành niên tại châu lục này. Trước đó, vào tháng 5 vừa qua, vaccine ngừa Covid-19 của hãng dược phẩm Pfizer đã được phê duyệt để sử dụng cho thanh thiếu niên.</p> <p>Vaccine của Moderna sẽ được tiêm 2 mũi, mỗi lần cách nhau 4 tuần.</p> <img src=\"https://cdntm.24hstatic.com/2021/7/24/10/d76c598d1031515aacde2fa5a7784279.jpg\" width=\"100%\"><em>EU phê duyệt tiêm vaccine ngừa Covid-19 của Moderna cho trẻ từ 12-17 tuổi. Ảnh minh họa: KT</em><p>Theo đánh giá của giới chuyên gia y tế, tiêm phòng cho trẻ em vốn cũng được xem là rất quan trọng để hướng tới đạt mục tiêu miễn dịch cộng đồng. Hãng dược phẩm Moderna hồi tháng 5 vừa qua khẳng định, vaccine của hãng này là hoàn toàn an toàn và hiệu quả khi áp dụng cho đối tượng trẻ vị thành niên.</p> <p>Cần có sự chấp thuận chính thức của Ủy ban Châu Âu để có thể bắt đầu triển khai tiêm vaccine ngừa Covid-19 cho lứa tuổi thanh thiếu niên trên toàn châu lục này./.</p>";

    // content = "<div> <table class=\"video\" style=\"text-align: justify;\"> <tbody> <tr> <td> <video controls=\"controls\" id=\"fplayVideo1\" onclick=\"showVideoArticle('https://streaming.tienphong.vn/87be3892e899691ec1f0dbac0acda766/60fd1d85/2021_07_24/video_chay_6953.mp4')\" width=\"100%\"></video><script language=\"javascript\" type=\"text/javascript\">var videoSource = \"https://streaming.tienphong.vn/87be3892e899691ec1f0dbac0acda766/60fd1d85/2021_07_24/video_chay_6953.mp4\";var listVideo = videoSource.split(\"***\");var videoCount = listVideo.length;var i=0;document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[0]);function videoPlay(videoNum)   {document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[videoNum]);document.getElementById(\"fplayVideo1\").load();document.getElementById(\"fplayVideo1\").play();}document.getElementById('fplayVideo1').addEventListener('ended',myHandler,false);function myHandler(){i++;if(i < videoCount){videoPlay(i);}}</script></td> </tr> <tr> <td class=\"caption\"><p>Vụ cháy nhìn từ nhà dân khu Linh Đàm (Video người dân cung cấp)</p></td> </tr> </tbody> </table> <p>Cụ thể, vào khoảng hơn 13h, nhiều người dân phát hiện hoả hoạn xảy ra lại khu nhà lán quây tôn nằm trong hẻm 42/58 Thịnh Liệt (Hoàng Mai) đã báo cho cơ quan chức năng.</p> <p>Do bên trong chứa một số đồ dễ cháy ngọn lửa bùng lên dữ dội, cột khói đen kịt bốc cao hàng chục mét.</p> <p>Nhận được tin báo, lực lượng Cảnh sát Phòng cháy, chữa cháy và Cứu nạn cứu hộ (PCCC&amp;CNCH) Công an quận Hoàng Mai điều 2 xe chữa cháy cùng cán bộ chiến sĩ tới hiện trường dập lửa. Lực lượng Cảnh sát PCCC&amp;CNCH Công an TP Hà Nội cũng được huy động hỗ trợ. Không lâu sau đó, đám cháy được dập tắt.</p> <p> <p> </p> </p> <img src=\"https://cdntm.24hstatic.com/2021/7/24/15/9d8e129a8b15db56349eca5cf00aff7c.jpg\" width=\"100%\"/><em>Lực lượng PCCC dập lửa.</em> <p>Theo thông tin ban đầu, đám cháy không gây thiệt hại về người. Khu vực xảy ra hoả hoạn là khu nhà lán tôn người dân dựng lên làm kho chứa vật liệu, sắt thép…</p> <p>Hiện nguyên nhân vụ việc đang được làm rõ.</p> <p> <i class=\"far fa-user-edit\"></i> <span class=\"cms-author\"> Thanh Hà </span> </p> </div>";

    // content = "<p>Mới đây, Á hậu Kim Duyên đăng clip tập luyện màn giới thiệu bản thân cho hành trình chinh chiến Miss Universe 2021. Cô đã thực hiện 3 màn hô tên khác nhau, thậm chí ghép nền nhạc Miss Universe vào để nhập tâm.</p> <p>Ai nấy đều cho rằng màn thể hiện đầu tiên của Kim Duyên là ổn nhất. Nhưng có người lại chê bai cô hô tên chưa thực sự đã tai, thậm chí nghe hơi &#34;cụt&#34;, thô. Có người khuyên cô nên nhiều thời gian tập luyện để có màn chào sân thực sự ấn tượng tại Miss Universe 2021.</p> <video controls=\"controls\" id=\"fplayVideo1\" onclick=\"showVideoArticle(&#39;https://media.phunutoday.vn/files/video/2021/07/24/kim-duyen-bi-che-cach-ho-viet-nam-khi-luyen-thi-miss-universe--2sao-1540.mp4&#39;)\" width=\"100%\"></video><script>var videoSource = \"https://media.phunutoday.vn/files/video/2021/07/24/kim-duyen-bi-che-cach-ho-viet-nam-khi-luyen-thi-miss-universe--2sao-1540.mp4\";var listVideo = videoSource.split(\"***\");var videoCount = listVideo.length;var i=0;document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[0]);function videoPlay(videoNum)   {document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[videoNum]);document.getElementById(\"fplayVideo1\").load();document.getElementById(\"fplayVideo1\").play();}document.getElementById('fplayVideo1').addEventListener('ended',myHandler,false);function myHandler(){i++;if(i < videoCount){videoPlay(i);}}</script> <p>Trước những bình luận khen chê, Kim Duyên đều vui vẻ đón nhận. Cô cho biết clip trên được quay cách đây vài tháng, bản thân vẫn đang trong quá trình tập luyện, lắng nghe để cải thiện.</p> <p>Sau thành công của H&#39;Hen Niê, Hoàng Thùy và Khánh Vân, nhiều người hy vọng Á hậu Nguyễn Huỳnh Kim Duyên sẽ làm nên chuyện ở đấu trường quốc tế. Cô nàng đang trau dồi các kỹ năng cần thiết, chuẩn bị hành trang tốt nhất cho việc đi thi quốc tế.</p> <img src=\"https://cdntm.24hstatic.com/2021/7/24/16/ba01aec2de6c13f119f20c7705440be9.jpg\" width=\"100%\"> <p>Mới đây, trong livestream trên fanpage của mình, Kim Duyên cũng đã thẳng thắn chia sẻ về việc học ngoại ngữ. Cô thừa nhận tiếng Anh của mình chưa được chuẩn dù trước đó cô có 2 năm đi du học. Cô tâm sự:<em> &#34;Trước khi qua Sing học, Duyên chỉ có thể nói được hello, hi,.... Đất nước đầu tiên Duyên được đi ra khỏi Việt Nam cũng là Singapore. Lúc đầu Duyên khá chật vật vì mình không nói được tiếng Anh và mình muốn đi Sing để có thể nói tiếng Anh giỏi!&#34;.</em></p>  <p>Duyên cho biết, khi đi du học, cô dành hẳn 1 năm đầu tiên chỉ để học tiếng Anh từ con số 0 nhưng vì bạn bè chủ yếu là người Việt, cô cũng sống cùng với người Việt Nam, điều này khiến ngoại ngữ của cô nàng không thể nào chuẩn. Do đó, Kim Duyên không có môi trường tốt nhất để trau dồi cách phát âm của mình sao cho chuẩn nhất.</p>   <p>Để cải thiện cho điều này, nàng Á hậu tiết lộ mình đang cố gắng luyện nghe nhiều hơn. Nếu trong vòng phỏng vấn ở Miss Universe, cô vẫn có thể hiểu được ban giám khảo hỏi gì để đáp lại. Cô còn cho biết, hiện tại mình có từ 2-3 lớp học tiếng Anh mỗi ngày bao gồm lớp pronunciation, lớp training về mindset và 1 lớp face to face với giáo viên nước ngoài. </p> <p>Do ảnh hưởng của dịch Covid-19, chỉ còn vài tháng nữa chung kết Miss Universe 2021 sẽ chính thức diễn ra. Mới đây, tối 20/5 chuyên trang sắc đẹp nổi tiếng Missosology đã viết bài chia sẻ về Á hậu Kim Duyên: <em>&#34;Cô gái 25 tuổi tốt nghiệp ngành Quản trị Kinh doanh, từng là Á hậu 1 Hoa hậu Hoàn vũ Việt Nam 2019 sẽ đại diện cho quốc gia Đông Nam Á trong cuộc thi Hoa hậu Hoàn vũ lần sau&#34;</em>, kèm theo đó là nhiều hình ảnh ấn tượng của Kim Duyên.</p> ";

    content = "<p>Mới đây trên trang cá nhân, Đàm Thu Trang đăng tải đoạn clip ghi lại khoảnh khắc của con gái Suchin cùng với dòng trạng thái khen ngợi: <em>&#34;Em bé tình cảm&#34;.</em></p><p>Cụ thể trong đoạn video, Suchin đang bò đến hôn Cường Đô La vì tưởng bố đã ngủ say. Hành động này chứng tỏ Suchin dù còn nhỏ nhưng rất tình cảm, yêu thương bố của mình. Tuy nhiên lúc này, Cường Đô La lại mở mắt bật dậy khiến Suchin òa khóc. Hóa ra, vị doanh nhân 8x chỉ đang giả vờ ngủ để chọc Suchin, và Đàm Thu Trang thì ghi được khoảnh khắc đầy tình cảm của con gái.</p><video controls=\"controls\" id=\"fplayVideo1\" onclick=\"showVideoArticle(&#39;https://ss-images.saostar.vn/pc/1627121161948/saostar-fcjltixw335j3co7.mp4&#39;)\" width=\"100%\"></video><script>var videoSource = \"https://ss-images.saostar.vn/pc/1627121161948/saostar-fcjltixw335j3co7.mp4\";var listVideo = videoSource.split(\"***\");var videoCount = listVideo.length;var i=0;document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[0]);function videoPlay(videoNum)   {document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[videoNum]);document.getElementById(\"fplayVideo1\").load();document.getElementById(\"fplayVideo1\").play();}document.getElementById('fplayVideo1').addEventListener('ended',myHandler,false);function myHandler(){i++;if(i < videoCount){videoPlay(i);}}</script><img src=\"https://ss-images.saostar.vn/pc/1627121161948/saostar-d7z0zph1sk9aoez5.gif\" width=\"100%\"><em>Suchin tập bò đến hôn Cường Đô La vì tưởng bố đã ngủ.</em><img src=\"https://ss-images.saostar.vn/pc/1627121161948/saostar-fue4g4d93imzpmju.gif\" width=\"100%\"><em></em><img src=\"https://ss-images.saostar.vn/pc/1627121161948/saostar-jslujs2qgp8nsbyo.gif\" width=\"100%\"><em>Bị bố phát hiện, Suchin liền bật khóc</em><p>Là một trong những nhóc tỳ nhà sao Việt siêu hot của làng giải trí, mọi khoảnh khắc con gái Cường Đô La đều nhận được rất nhiều sự chú ý từ khán giả. Cư dân mạng vô cùng thích thú trước độ đáng yêu của bé Suchin.</p><img src=\"https://cdntm.24hstatic.com/2021/7/24/17/7e2394ee7f64e85c45d68eae6e772b55.jpg\" width=\"100%\"><em></em><img src=\"https://cdntm.24hstatic.com/2021/7/24/17/e9974ddee33385325f7edfd05579cd71.jpg\" width=\"100%\"><em>Suchin cũng là một &#34;thế lực nhí&#34; đang được nhiều khán giả chú ý và yêu thích.</em><p>Cường Đô La và Đàm Thu Trang đã về chung một nhà được 2 năm. Cặp đôi chào đón cô con gái Suchin vào tháng 8/2020. Dù Cường Đô La không phải là nghệ sĩ, Đàm Thu Trang đã không còn hoạt động showbiz từ lâu nhưng gia đình nhỏ của cặp đôi vẫn nhận được nhiều sự quan tâm của công chúng. Đặc biệt những khoảnh khắc của tiểu công chúa Suchin lúc nào cũng khiến dân tình thích thú.</p>";

    var document = CCCC.parse(content);
    var body = document.body!;

    List<dataHtml> arrayContent = [];

    arrayContent.add(dataHtml("Liên Hợp Quốc kêu gọi Trung Quốc phối hợp điều tra nguồn gốc COVID-19 giai đoạn 2", "title"));
    arrayContent.add(dataHtml("Tổng hợp", "category"));
    arrayContent.add(dataHtml("Liên Hợp Quốc đã kêu gọi Trung Quốc tham gia vào cuộc điều tra giai đoạn 2 về nguồn gốc đại dịch COVID-19 sau khi nước này bác đề xuất của WHO.", "desc"));

    print("bay vao the video 1:" + body.children.length.toString());


    for(int i=0;i<body.children.length;i++) {
      var element = body.children[i];
      print("Gap the: " + element.localName.toString());

      if(element.localName == "p") {
        var text = element.innerHtml;
        if (text.length > 0) {
          var content = element.innerHtml;
          var type = "text";
          arrayContent.add(dataHtml(content, type));
        }
      } else if (element.localName == "em") {
        var text = element.innerHtml;
        if (text.length > 0) {
          var content = element.innerHtml;
          var type = "underline";
          arrayContent.add(dataHtml(content, type));
        }
      } else if (element.localName == "img") {
        var src = element.attributes["src"];
        if (src != null) {
          var type = "img";
          var content = src;
          arrayContent.add(dataHtml(content, type));
        }
      } else if (element.localName == "video") {
        var str = element.attributes.toString();

        const start = "showVideoArticle('";
        const end = "')";
        if(str.indexOf(start) > 0 && str.indexOf(end) > 0) {
          final startIndex = str.indexOf(start);
          final endIndex = str.indexOf(end, startIndex + start.length);

          var type = "video";
          var content = str.substring(startIndex + start.length, endIndex);
          arrayContent.add(dataHtml(content, type));
        }
      }
    }

    if(arrayContent.length > 0) {
      setState(() {
        this.arrayContent.addAll(arrayContent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: arrayContent.length,
          itemBuilder: (c, i) => getWidgetWithContent(arrayContent[i]))
    );
  }
  
  Widget getWidgetWithContent(dataHtml data) {
    var type = data.type;
    var content = data.content;
    if(type == "title") {
      return Padding(
        padding: EdgeInsets.only(left: 16, bottom: 14, right: 16, top: 25),
        child: Text(content, style: TextStyle(
            fontSize: 27,
             fontWeight: FontWeight.bold
        ),),
      );
    }
    else if(type == "category") {
      return Padding(padding: EdgeInsets.only(left: 16, ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35,
            color: Colors.red,
            child: FlatButton(
              child: Text('Tổng hợp', style: TextStyle(fontSize: 16.0,
                  color: Colors.white),),
              onPressed: () {})
          ),
          SizedBox(width: 8,),
          Text("Sao Star", style: TextStyle(fontSize: 16.0,
              color: Colors.blue)),
        ],
      ));
    }
    else if(type == "desc") {
      return Padding(
        padding: EdgeInsets.only(left: 16, bottom: 20, right: 16, top: 16),
        child: Text(content, style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.normal
        ),),
      );
    }
    else if(type == "text") {
      return Padding(
        padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Text(content, style: TextStyle(
          fontSize: 18
        ),),
      );
    }
    else if(type == "underline") {
      return Padding(
        padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Text(content, style: TextStyle(
            fontSize: 16,
          fontStyle: FontStyle.italic
        ),),
      );
    }
    else if(type == "img") {
      return Padding(
        padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: Image.network(content, width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9/16,
          fit: BoxFit.cover,
        ),
      );
    }
    else if(type == "video") {
      return Padding(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
        child: Container(
          color: Colors.transparent,
          height: (MediaQuery.of(context).size.width - 32) * 9/16,
          child: videocontroller(),
        ),);
    }
    
    return SizedBox(height: 0.1);
  }

  Widget videocontroller(){
    chewieController = ChewieController(
      showControls: true,
      allowFullScreen: false,
      autoPlay: true,
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

  void initialVideoPlayer() async {
    videoPlayerController = VideoPlayerController.network(
      "https://gamek.mediacdn.vn/133514250583805952/2021/7/23/cl4-1627038520369176110151.mp4",
    );

    await videoPlayerController.initialize();
  }
}