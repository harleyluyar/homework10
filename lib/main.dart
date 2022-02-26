import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homework10/InfoModel.dart';
import 'comment.dart';


void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 22.0,
            //fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: Test(),
    );
  }
}
class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<InfoModel> InfoReportLIst = [
    InfoModel(username: 'Sompong', imgProfile: 'ธรรมะปล่อยวาง-01.jpg', imgPost: 'ธรรมะปล่อยวาง-01.jpg' , detail: 'ถ้าเราปล่อยวางเล็กน้อย เราก็จะมีความสงบเล็กน้อย \n.ถ้าเราปล่อยวางมาก เราก็จะมีความสงบมาก\nถ้าเราปล่อยวางได้หมด ทุกอย่างก็จะสมบูรณ์',
        cm: [comment(username: 'ยิ้ม', text: 'ละเมอ'),comment(username: 'harlem', text: 'สาธุ99'),comment(username: 'mudeng', text: '@harlem สมพรปาก สาธุ')]),
    InfoModel(username: 'พระเอง', imgProfile: 'พระ2.jpg', imgPost: 'พระ2.jpg' , detail: 'คนที่มีดวงตาเห็นธรรมแล้ว จะไม่วุ่นวายกับอะไรทั้งสิ้น \nอะไรจะมีก็มีไป อะไรจะสูญก็สูญไป\nแต่ใจจะไม่ไปดีอกดีใจ เสียอกเสียใจ กับการมาและการไปของสิ่งต่างๆ',
        cm: [comment(username: 'kie1991', text: 'ชอบมากค่ะ'),comment(username: 'Sompong', text: 'สวัสดีพระเอง'),comment(username: 'kie1991', text: '@Sompong กราบสวัสดีค่ะ')] ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ธรรมะสวัสดี')),
      body: ListView.builder(
          itemCount: InfoReportLIst.length,
          itemBuilder: (context, index) =>
              MyCard(info: InfoReportLIst[index])),
    );
  }
}

class MyCard extends StatefulWidget {
  final InfoModel info;

  MyCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  String result='';
  bool addFavorite = false;
  final TextEditingController _textController = new TextEditingController();
  String str(){
    result='';
    for (var i = 0; i < widget.info.cm.length; i++) {
      result+=widget.info.cm[i].username+' '+widget.info.cm[i].text+'\n';
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),

      ),
      elevation: 5,
      margin: EdgeInsets.all(20),
      child:Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: ExactAssetImage('assets/images/${widget.info.imgProfile}'),
                          )
                      )),
                ),
                Text(widget.info.username),
                Expanded(
                  child: Container(
                    width: 50,
                  ),
                ),
                IconButton(
                  iconSize: 25,
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Image.asset('assets/images/${widget.info.imgPost}', width: 250.0, fit: BoxFit.fill,),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.info.detail),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(str(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _textController,
                  textAlign: TextAlign.start,
                  decoration: new InputDecoration(
                    prefixIcon:IconButton(
                        icon: Icon(addFavorite ? Icons.favorite : Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            addFavorite = !addFavorite;
                          });
                        }),
                    hintText: "Add a comment..",
                  ),
                  onSubmitted: (String str){
                    setState((){
                      widget.info.addComment('flutter', str);
                      _textController.clear();
                    });
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
