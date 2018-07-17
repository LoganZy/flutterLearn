import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new ContainerTestApp(),));
}
class ContainerTestApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ContainerApp"),
      ),
//      body: new Container(
//        alignment: Alignment.center,
//        width: 300.0,
//        height: 300.0,
////        color: Colors.red,
//        padding: EdgeInsets.all(20.0),
//        margin: EdgeInsets.all(20.0),
//        constraints: new BoxConstraints.expand(height: 200.0),
//        transform: new Matrix4.skewX(0.1),
//        decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("http://pic.58pic.com/00/94/40/02bOOOPIC2e.jpg"))),
//        child: new Text("接下来在容器内加上一个Text文本并且增加一段话,接下来在容器内加上一个Text文本并且增加一段话,接下来在容器内加上一个Text文本并且增加一段话"),
//      ),
    body: new Center(
      child: new Container(
        color: Colors.blue,
        width: 300.0,
        height: 300.0,
        alignment: Alignment.bottomRight,
        child: new Container(
          width: 100.0,
          height: 100.0,
          color: Colors.lightBlueAccent,
          child: new Icon(Icons.android,color: Colors.red,),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10.0),
        ),
      ),
    ),
    );
  }

}