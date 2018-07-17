import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new LayoutApp(),));
}
class LayoutApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Layout App'),
      ),
//      body: new Row(
//        children: <Widget>[
//          new Text("这是tv1--|hahahhahahahahahahahahaha"),
//          new Text("这是tv1--|"),
//          new Text("这是tv1--|"),
//        ],
//      ),
//      body: new Row(
//        children: <Widget>[
//          new Expanded(child: new Text("这是tv1--|hahahhahahahahahahahahaha"),flex: 3,),
//          new Expanded(child: new Text("这是tv1--|")),
//          new Expanded(child: new Text("这是tv1--|")),
//        ],
//      ) ,
//      body: new Column(
//        children: <Widget>[
//          new Expanded(child: new Text("这是tv1--|hahahhahahahahahahahahaha"),flex: 3,),
//          new Expanded(child: new Text("这是tv1--|")),
//          new Expanded(child: new Text("这是tv1--|")),
//        ],
//      ) ,
      body: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(
                  color: Colors.grey
                )
              )
            ),
            child: new Row(
              children: <Widget>[
                new Icon(Icons.chat,color: Colors.lightBlueAccent,),
                new Expanded(
                  child: new Text(
                    "消息记录",
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
          new MyItemList(Icons.star, "我的收藏"),
          new MyItemList(Icons.lock, "我的账户"),
          new MyItemList(Icons.send, "意见反馈"),
        ],
      ),
    );
  }
}

class MyItemList extends StatelessWidget{
  IconData myIcons;
  String myItemText;

  MyItemList(this.myIcons, this.myItemText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(
                  color: Colors.grey
              )
          )
      ),
      child: new Row(
        children: <Widget>[
          new Icon(myIcons,color: Colors.lightBlueAccent,),
          new Expanded(
            child: new Text(
              myItemText,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }

}