import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detailnotification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return detailnotificationstate();
  }
}

class detailnotificationstate extends State<detailnotification>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông báo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Sữa Meiji số 9 800g phù hợp cho trẻ từ 1-3 tuổi, không chỉ chứa các chất dinh dưỡng cơ bản như protein, chất béo, carbohydrat mà còn có các vitamin và khoáng chất rất khó có được từ sữa bò và thức ăn dạng rắn. Meiji còn bổ sung cả axit docosahexaenoic (DHA), các nucleotides và đặc biệt là hệ chất xơ GOS hỗ trợ tiêu hóa làm nên đặc tính mát của sữa giúp thúc đẩy sự phát triển toàn diện cả về thể chất lẫn não bộ của trẻ trong suốt giai đoạn thơ ấu. Sản phẩm được dùng bổ sung cùng các bữa ăn hàng ngày của bé, đem đến nguồn năng lượng dồi dào cho bé tiếp tục các hoạt động vui chơi và khám phá.",
            style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

