import 'package:flutter/material.dart';
class Page2 extends StatelessWidget {
  final title;
  Page2(this.title);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page2"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("返回Intent App"),
            color: Colors.blue,
            highlightColor: Colors.lightBlue,
            onPressed: (){
              Navigator.of(context).pop("我是第二个页面返回的数据：$title");
            },
        ),
      ),
    );
  }


}