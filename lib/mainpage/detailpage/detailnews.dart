import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:html/dom.dart' as DOM;
import 'package:html/dom_parsing.dart' as DOM_PARSING;
import 'package:html/parser.dart' as PARSE;
import 'package:mulsehouse/class/dataHtml.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/services.dart';

enum ShowFullScreen {
  none,
  image
}

class detailnews extends StatefulWidget {
  final dynamic news;
  const detailnews(this.news);

  @override
  State<StatefulWidget> createState() {
    return detailnewsState();
  }
}

class detailnewsState extends State<detailnews> {
  List<dataHtml> arrayContent = [];
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  ShowFullScreen showFullScreen = ShowFullScreen.none;
  var controllerListView = CarouselController();
  List<String> arrImage = [];

  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialVideoPlayer();

    parseContentNative();
  }

  void parseContentNative(){
    String content = "";
    // content = "<p>Đây sẽ là loại vaccine thứ hai được sử dụng cho trẻ vị thành niên tại châu lục này. Trước đó, vào tháng 5 vừa qua, vaccine ngừa Covid-19 của hãng dược phẩm Pfizer đã được phê duyệt để sử dụng cho thanh thiếu niên.</p> <p>Vaccine của Moderna sẽ được tiêm 2 mũi, mỗi lần cách nhau 4 tuần.</p> <img src=\"https://cdntm.24hstatic.com/2021/7/24/10/d76c598d1031515aacde2fa5a7784279.jpg\" width=\"100%\"><em>EU phê duyệt tiêm vaccine ngừa Covid-19 của Moderna cho trẻ từ 12-17 tuổi. Ảnh minh họa: KT</em><p>Theo đánh giá của giới chuyên gia y tế, tiêm phòng cho trẻ em vốn cũng được xem là rất quan trọng để hướng tới đạt mục tiêu miễn dịch cộng đồng. Hãng dược phẩm Moderna hồi tháng 5 vừa qua khẳng định, vaccine của hãng này là hoàn toàn an toàn và hiệu quả khi áp dụng cho đối tượng trẻ vị thành niên.</p> <p>Cần có sự chấp thuận chính thức của Ủy ban Châu Âu để có thể bắt đầu triển khai tiêm vaccine ngừa Covid-19 cho lứa tuổi thanh thiếu niên trên toàn châu lục này./.</p>";

    // content = "<div> <table class=\"video\" style=\"text-align: justify;\"> <tbody> <tr> <td> <video controls=\"controls\" id=\"fplayVideo1\" onclick=\"showVideoArticle('https://streaming.tienphong.vn/87be3892e899691ec1f0dbac0acda766/60fd1d85/2021_07_24/video_chay_6953.mp4')\" width=\"100%\"></video><script language=\"javascript\" type=\"text/javascript\">var videoSource = \"https://streaming.tienphong.vn/87be3892e899691ec1f0dbac0acda766/60fd1d85/2021_07_24/video_chay_6953.mp4\";var listVideo = videoSource.split(\"***\");var videoCount = listVideo.length;var i=0;document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[0]);function videoPlay(videoNum)   {document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[videoNum]);document.getElementById(\"fplayVideo1\").load();document.getElementById(\"fplayVideo1\").play();}document.getElementById('fplayVideo1').addEventListener('ended',myHandler,false);function myHandler(){i++;if(i < videoCount){videoPlay(i);}}</script></td> </tr> <tr> <td class=\"caption\"><p>Vụ cháy nhìn từ nhà dân khu Linh Đàm (Video người dân cung cấp)</p></td> </tr> </tbody> </table> <p>Cụ thể, vào khoảng hơn 13h, nhiều người dân phát hiện hoả hoạn xảy ra lại khu nhà lán quây tôn nằm trong hẻm 42/58 Thịnh Liệt (Hoàng Mai) đã báo cho cơ quan chức năng.</p> <p>Do bên trong chứa một số đồ dễ cháy ngọn lửa bùng lên dữ dội, cột khói đen kịt bốc cao hàng chục mét.</p> <p>Nhận được tin báo, lực lượng Cảnh sát Phòng cháy, chữa cháy và Cứu nạn cứu hộ (PCCC&amp;CNCH) Công an quận Hoàng Mai điều 2 xe chữa cháy cùng cán bộ chiến sĩ tới hiện trường dập lửa. Lực lượng Cảnh sát PCCC&amp;CNCH Công an TP Hà Nội cũng được huy động hỗ trợ. Không lâu sau đó, đám cháy được dập tắt.</p> <p> <p> </p> </p> <img src=\"https://cdntm.24hstatic.com/2021/7/24/15/9d8e129a8b15db56349eca5cf00aff7c.jpg\" width=\"100%\"/><em>Lực lượng PCCC dập lửa.</em> <p>Theo thông tin ban đầu, đám cháy không gây thiệt hại về người. Khu vực xảy ra hoả hoạn là khu nhà lán tôn người dân dựng lên làm kho chứa vật liệu, sắt thép…</p> <p>Hiện nguyên nhân vụ việc đang được làm rõ.</p> <p> <i class=\"far fa-user-edit\"></i> <span class=\"cms-author\"> Thanh Hà </span> </p> </div>";

    // content = "<p>Mới đây, Á hậu Kim Duyên đăng clip tập luyện màn giới thiệu bản thân cho hành trình chinh chiến Miss Universe 2021. Cô đã thực hiện 3 màn hô tên khác nhau, thậm chí ghép nền nhạc Miss Universe vào để nhập tâm.</p> <p>Ai nấy đều cho rằng màn thể hiện đầu tiên của Kim Duyên là ổn nhất. Nhưng có người lại chê bai cô hô tên chưa thực sự đã tai, thậm chí nghe hơi &#34;cụt&#34;, thô. Có người khuyên cô nên nhiều thời gian tập luyện để có màn chào sân thực sự ấn tượng tại Miss Universe 2021.</p> <video controls=\"controls\" id=\"fplayVideo1\" onclick=\"showVideoArticle(&#39;https://media.phunutoday.vn/files/video/2021/07/24/kim-duyen-bi-che-cach-ho-viet-nam-khi-luyen-thi-miss-universe--2sao-1540.mp4&#39;)\" width=\"100%\"></video><script>var videoSource = \"https://media.phunutoday.vn/files/video/2021/07/24/kim-duyen-bi-che-cach-ho-viet-nam-khi-luyen-thi-miss-universe--2sao-1540.mp4\";var listVideo = videoSource.split(\"***\");var videoCount = listVideo.length;var i=0;document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[0]);function videoPlay(videoNum)   {document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[videoNum]);document.getElementById(\"fplayVideo1\").load();document.getElementById(\"fplayVideo1\").play();}document.getElementById('fplayVideo1').addEventListener('ended',myHandler,false);function myHandler(){i++;if(i < videoCount){videoPlay(i);}}</script> <p>Trước những bình luận khen chê, Kim Duyên đều vui vẻ đón nhận. Cô cho biết clip trên được quay cách đây vài tháng, bản thân vẫn đang trong quá trình tập luyện, lắng nghe để cải thiện.</p> <p>Sau thành công của H&#39;Hen Niê, Hoàng Thùy và Khánh Vân, nhiều người hy vọng Á hậu Nguyễn Huỳnh Kim Duyên sẽ làm nên chuyện ở đấu trường quốc tế. Cô nàng đang trau dồi các kỹ năng cần thiết, chuẩn bị hành trang tốt nhất cho việc đi thi quốc tế.</p> <img src=\"https://cdntm.24hstatic.com/2021/7/24/16/ba01aec2de6c13f119f20c7705440be9.jpg\" width=\"100%\"> <p>Mới đây, trong livestream trên fanpage của mình, Kim Duyên cũng đã thẳng thắn chia sẻ về việc học ngoại ngữ. Cô thừa nhận tiếng Anh của mình chưa được chuẩn dù trước đó cô có 2 năm đi du học. Cô tâm sự:<em> &#34;Trước khi qua Sing học, Duyên chỉ có thể nói được hello, hi,.... Đất nước đầu tiên Duyên được đi ra khỏi Việt Nam cũng là Singapore. Lúc đầu Duyên khá chật vật vì mình không nói được tiếng Anh và mình muốn đi Sing để có thể nói tiếng Anh giỏi!&#34;.</em></p>  <p>Duyên cho biết, khi đi du học, cô dành hẳn 1 năm đầu tiên chỉ để học tiếng Anh từ con số 0 nhưng vì bạn bè chủ yếu là người Việt, cô cũng sống cùng với người Việt Nam, điều này khiến ngoại ngữ của cô nàng không thể nào chuẩn. Do đó, Kim Duyên không có môi trường tốt nhất để trau dồi cách phát âm của mình sao cho chuẩn nhất.</p>   <p>Để cải thiện cho điều này, nàng Á hậu tiết lộ mình đang cố gắng luyện nghe nhiều hơn. Nếu trong vòng phỏng vấn ở Miss Universe, cô vẫn có thể hiểu được ban giám khảo hỏi gì để đáp lại. Cô còn cho biết, hiện tại mình có từ 2-3 lớp học tiếng Anh mỗi ngày bao gồm lớp pronunciation, lớp training về mindset và 1 lớp face to face với giáo viên nước ngoài. </p> <p>Do ảnh hưởng của dịch Covid-19, chỉ còn vài tháng nữa chung kết Miss Universe 2021 sẽ chính thức diễn ra. Mới đây, tối 20/5 chuyên trang sắc đẹp nổi tiếng Missosology đã viết bài chia sẻ về Á hậu Kim Duyên: <em>&#34;Cô gái 25 tuổi tốt nghiệp ngành Quản trị Kinh doanh, từng là Á hậu 1 Hoa hậu Hoàn vũ Việt Nam 2019 sẽ đại diện cho quốc gia Đông Nam Á trong cuộc thi Hoa hậu Hoàn vũ lần sau&#34;</em>, kèm theo đó là nhiều hình ảnh ấn tượng của Kim Duyên.</p> ";

    // content = "<p>Mới đây trên trang cá nhân, Đàm Thu Trang đăng tải đoạn clip ghi lại khoảnh khắc của con gái Suchin cùng với dòng trạng thái khen ngợi: <em>&#34;Em bé tình cảm&#34;.</em></p><p>Cụ thể trong đoạn video, Suchin đang bò đến hôn Cường Đô La vì tưởng bố đã ngủ say. Hành động này chứng tỏ Suchin dù còn nhỏ nhưng rất tình cảm, yêu thương bố của mình. Tuy nhiên lúc này, Cường Đô La lại mở mắt bật dậy khiến Suchin òa khóc. Hóa ra, vị doanh nhân 8x chỉ đang giả vờ ngủ để chọc Suchin, và Đàm Thu Trang thì ghi được khoảnh khắc đầy tình cảm của con gái.</p><video controls=\"controls\" id=\"fplayVideo1\" onclick=\"showVideoArticle(&#39;https://ss-images.saostar.vn/pc/1627121161948/saostar-fcjltixw335j3co7.mp4&#39;)\" width=\"100%\"></video><script>var videoSource = \"https://ss-images.saostar.vn/pc/1627121161948/saostar-fcjltixw335j3co7.mp4\";var listVideo = videoSource.split(\"***\");var videoCount = listVideo.length;var i=0;document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[0]);function videoPlay(videoNum)   {document.getElementById(\"fplayVideo1\").setAttribute(\"src\",listVideo[videoNum]);document.getElementById(\"fplayVideo1\").load();document.getElementById(\"fplayVideo1\").play();}document.getElementById('fplayVideo1').addEventListener('ended',myHandler,false);function myHandler(){i++;if(i < videoCount){videoPlay(i);}}</script><img src=\"https://ss-images.saostar.vn/pc/1627121161948/saostar-d7z0zph1sk9aoez5.gif\" width=\"100%\"><em>Suchin tập bò đến hôn Cường Đô La vì tưởng bố đã ngủ.</em><img src=\"https://ss-images.saostar.vn/pc/1627121161948/saostar-fue4g4d93imzpmju.gif\" width=\"100%\"><em></em><img src=\"https://ss-images.saostar.vn/pc/1627121161948/saostar-jslujs2qgp8nsbyo.gif\" width=\"100%\"><em>Bị bố phát hiện, Suchin liền bật khóc</em><p>Là một trong những nhóc tỳ nhà sao Việt siêu hot của làng giải trí, mọi khoảnh khắc con gái Cường Đô La đều nhận được rất nhiều sự chú ý từ khán giả. Cư dân mạng vô cùng thích thú trước độ đáng yêu của bé Suchin.</p><img src=\"https://cdntm.24hstatic.com/2021/7/24/17/7e2394ee7f64e85c45d68eae6e772b55.jpg\" width=\"100%\"><em></em><img src=\"https://cdntm.24hstatic.com/2021/7/24/17/e9974ddee33385325f7edfd05579cd71.jpg\" width=\"100%\"><em>Suchin cũng là một &#34;thế lực nhí&#34; đang được nhiều khán giả chú ý và yêu thích.</em><p>Cường Đô La và Đàm Thu Trang đã về chung một nhà được 2 năm. Cặp đôi chào đón cô con gái Suchin vào tháng 8/2020. Dù Cường Đô La không phải là nghệ sĩ, Đàm Thu Trang đã không còn hoạt động showbiz từ lâu nhưng gia đình nhỏ của cặp đôi vẫn nhận được nhiều sự quan tâm của công chúng. Đặc biệt những khoảnh khắc của tiểu công chúa Suchin lúc nào cũng khiến dân tình thích thú.</p>";

    content = "<img src=\"https://cdntm.24hstatic.com/2021/7/24/7/041d147783bd4e051690464bfbf26c29.png\" width=\"100%\"><em> </em> <p>Trước khi lên sóng truyền hình, dù nhân vật chính có là ai, là nghệ sĩ hay doanh nhân thì vẫn được trang điểm một lớp nhẹ phía sau hậu trường. Khi đó, hình ảnh lên sóng sẽ tươi tắn hơn, trẻ trung hơn.</p><p>Các &#34;cá mập&#34; lên sóng chương trình Shark Tank Việt Nam (Thương vụ bạc tỷ) cũng không nằm ngoại lệ. Họ được ekip phía sau hỗ trợ từ kịch bản đến trang phục cũng như make-up sao cho hài hòa với sóng truyền hình. </p><p>Ấy vậy mà, trong buổi livestream trực tiếp chia sẻ với người hâm mộ nằm trong khuôn khổ chương trình Shark Tank Việt Nam mùa 4, Shark Nguyễn Hòa Bình đã tự tin công khai mặt mộc của mình. Thực ra, lý do không phải Shark Bình cố ý muốn vậy để gây chú ý đâu! Mà bởi CEO của NextTech... đi muộn nên đành bất chấp để mặt mộc trước mấy nghìn người hâm mộ.</p><img src=\"https://cdntm.24hstatic.com/2021/7/24/7/f93f18d937ce36561a188c24e8f05f58.jpg\" width=\"100%\"><em></em><img src=\"https://cdntm.24hstatic.com/2021/7/24/7/c9df596d9a7f868c729b3efd5847a1e3.jpg\" width=\"100%\"><em></em><p>Biết mình đã muộn giờ nhưng Shark Bình vẫn giữ phong thái tự tin, chuyên nghiệp trước máy quay và gửi lời chào cũng như lời xin lỗi tới quý khán giả:<em> &#34;Xin chào các bạn, xin lỗi để các bạn chờ lâu nhé. Hôm nay đường kẹt xe quá nên là đến phim trường hơi muộn, làm cho mình chưa kịp makeup gì hết&#34;.</em></p><p>Vì lí do tắc đường, đến trường quay muộn nên Shark Bình quyết định &#34;vào việc&#34; luôn để khán giả không phải đợi. Anh cũng nói luôn với người hâm mộ là anh đang để mặt mộc. Nhưng khán giả lại không tin vào điều đó và liên tục hỏi:<em> &#34;Có phải Shark chưa makeup thật không?&#34;, &#34;Chưa makeup mà sao da Shark lại láng mịn thế?&#34;...</em></p><p>Thì ra, Shark Bình đã nhờ đến phần mềm chỉnh mặt để thật tự tin để lên sóng. Sau đó, anh thậm chí còn hướng dẫn người xem livestream sử dụng phần mềm từ bóp cằm, thon mặt, gọn mũi, mắt to... vô cùng thuần thục.</p><img src=\"https://cdntm.24hstatic.com/2021/7/24/7/ee4d29edda3c1f857998712e4584d045.jpg\" width=\"100%\"><em></em><img src=\"https://cdntm.24hstatic.com/2021/7/24/7/ba984b8b5df7600ad665df4a761d1db5.jpg\" width=\"100%\"><em></em><p>Shark Bình không hổ là Shark công nghệ, phải không? Ngoài đời, các &#34;cá mập&#34; có nhiều cơ hội hơn để thể hiện những tính cách đáng yêu trước người hâm mộ. Một lần khác, Shark Bình còn vô tư... đánh son khi livestream.</p><p>Chả là, nhân dịp học viện dạy livestream bán hàng online của mình ra mắt thị trường TP. Hồ Chí Minh vào cuối tháng 3, Shark Bình đã thực hiện thử thách tự mình livestream bán hàng. Tuy nhiên, vì cây son không phải đồ vật thân thuộc nên CEO của NextTech khá lúng túng khi cầm nó trên tay.</p><p>Khi nhận được sự trợ giúp của chuyên gia livestream cùng, Shark Bình cũng không tự tin nên son đánh lên môi có phần bị lem ra ngoài. Dù khá ngại ngùng nhưng sau khi được tô son, anh bặm môi để son đều hơn.</p><img src=\"https://cdntm.24hstatic.com/2021/7/24/7/31d120b987dae08b9d66ad355620ed6a.png\" width=\"100%\"><em></em><img src=\"https://cdntm.24hstatic.com/2021/7/24/7/0043e0d347494c040d86147fa37f4ce3.jpg\" width=\"100%\"><em></em><p>Còn dưới đây là những hình ảnh hậu trường của Shark Nguyễn Hòa Bình trong chương trình Shark Tank Việt Nam. Dù trang điểm giúp Shark Bình trở nên điển trai hơn nhưng những màn &#34;chốt deal&#34; của Shark vẫn thật ấn tượng, phải không?</p><video controls=\"controls\" id=\"fplayVideo0\" onclick=\"showVideoArticle(&#39;https://cafebiz.cafebizcdn.vn/162123310254002176/2021/7/23/GyUdxcMo3Ac-1627034336103214554525.mp4&#39;)\" width=\"100%\"></video><script>var videoSource = \"https://cafebiz.cafebizcdn.vn/162123310254002176/2021/7/23/GyUdxcMo3Ac-1627034336103214554525.mp4\";var listVideo = videoSource.split(\"***\");var videoCount = listVideo.length;var i=0;document.getElementById(\"fplayVideo0\").setAttribute(\"src\",listVideo[0]);function videoPlay(videoNum)   {document.getElementById(\"fplayVideo0\").setAttribute(\"src\",listVideo[videoNum]);document.getElementById(\"fplayVideo0\").load();document.getElementById(\"fplayVideo0\").play();}document.getElementById('fplayVideo0').addEventListener('ended',myHandler,false);function myHandler(){i++;if(i < videoCount){videoPlay(i);}}</script><p>Cô giáo Vật lý &#34;triệu view&#34; là ai mà đến cả PewPew cũng thức đến 12h đêm nghe giảng bài?</p> <strong>PV</strong>";

    content = widget.news["content"];

    // content = "<p>Biết mình đã muộn giờ nhưng Shark Bình vẫn giữ phong thái tự tin, chuyên nghiệp trước máy quay và gửi lời chào cũng như lời xin lỗi tới quý khán giả:<em> &#34;Xin chào các bạn, xin lỗi để các bạn chờ lâu nhé. Hôm nay đường kẹt xe quá nên là đến phim trường hơi muộn, làm cho mình chưa kịp makeup gì hết&#34;.</em></p>";

    var document = PARSE.parse(content);
    var body = document.body!;

    List<dataHtml> arrayContent = [];

    arrayContent.add(dataHtml(widget.news["title"], "title"));
    arrayContent.add(dataHtml("Tổng hợp", "category"));
    arrayContent.add(dataHtml(widget.news["desc"], "desc"));

    print("bay vao the video 1:" + body.children.length.toString());

    for(int i=0;i<body.children.length;i++) {
      var element = body.children[i];
      print("Gap the: " + element.localName.toString());

      if(element.localName == "p") {
        if(element.children.length > 0) {
          //html
          var text = element.innerHtml;
          if (text.length > 0) {
            var content = element.innerHtml;
            var type = "textHtml";
            arrayContent.add(dataHtml(content, type));
          }
        } else {
          //normal
          var text = element.text;
          if (text.length > 0) {
            var content = element.text;
            var type = "text";
            arrayContent.add(dataHtml(content, type));
          }
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
          arrImage.add(src);
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

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void showSnack(String title){

    final snackbar = SnackBar(
        content: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 15,),)
    );
    scaffoldMessengerKey.currentState!.showSnackBar(snackbar);

  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Scaffold(
        appBar: showFullScreen == ShowFullScreen.none ? AppBar(
            title: GestureDetector(
              onLongPress: (){
                Clipboard.setData(new ClipboardData(text: widget.news["lid"]));
                showSnack("Copied");
              },
              child: Text(widget.news["lid"], style: TextStyle(fontSize: 13)),
            )): null,
        body: bodyWidget()
    ));
  }

  static const platform =
  const MethodChannel('flutterplugins.javatpoint.com/interaction');
  Future<void> showPhoto(String content) async {
    try {
      print("goi vao day");
      // final int result = await platform.invokeMethod(
      //     'enablepush', arrImage);
      final int result = await platform.invokeMethod(
          'showPhoto', <String, dynamic>{'content': content, 'array' : arrImage});
    } on PlatformException catch (e) {
      // Unable to open the browser
      print(e);
    }
  }

  Widget bodyWidget() {
    if(this.showFullScreen == ShowFullScreen.image) {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider.builder(
            options: CarouselOptions(
              height: double.infinity,
              enlargeCenterPage: false,
              viewportFraction: 1,
            ),
            carouselController: controllerListView,
            itemCount: arrImage.length,
            itemBuilder: (c, i, realIdx) => GestureDetector(
                onTap: (){
                  setState(() {
                    this.showFullScreen = ShowFullScreen.none;
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      child: Image.network(arrImage[i], fit: BoxFit.fitHeight),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 30, top: 40),
                      child: Icon(Icons.close),
                    )
                  ],
                )
            )
        ),
      );
    }

    return ListView.builder(
        itemCount: arrayContent.length,
        itemBuilder: (c, i) => getWidgetWithContent(arrayContent[i]));
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
        padding: EdgeInsets.only(left: 16, bottom: 10, right: 16, top: 16),
        child: Text(content, style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.normal
        ),),
      );
    }
    else if(type == "text") {
      return Padding(
        padding: EdgeInsets.only(left: 16, bottom: 8, right: 16),
        child: Text(content, style: TextStyle(
            fontSize: 18
        ),),
      );
    }
    else if(type == "textHtml") {
      return Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8, right: 8),
          child: Html(data: content, style: {
            "body":Style(fontSize: FontSize(18.0))
          })
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
        padding: EdgeInsets.only(left: 16, bottom: 8, right: 16),
        child: GestureDetector(
          onTap: (){
            // setState(() {
            //   this.showFullScreen = ShowFullScreen.image;
            // });
            showPhoto(content);
          },
          child: Image.network(content, width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 9/16,
            fit: BoxFit.cover,
          ),
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