import 'dart:math';

import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(home: new MyHome(),));
}
class MyHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyHomeState();
  }

}
class MyHomeState extends State<MyHome>{
  var currentIndex = 0 ;
  var total = 0 ;

  _onFloatActionButtonPressed(){
    setState(() {
//      currentIndex =new Random().nextInt(4);
      total++;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("myHome"),
      ),
      body: new Center(
//        child: new IndexedStack(
//          index: currentIndex,
//          children: <Widget>[
//            new Icon(
//              Icons.cloud_download,
//              size: 100.0,
//              color: Colors.blue,
//            ),
//            new Icon(
//              Icons.error_outline,
//              size: 100.0,
//              color: Colors.red,
//            ),
//            new Icon(
//              Icons.check_circle,
//              size: 100.0,
//              color: Colors.green,
//            ),
//            new Icon(
//              Icons.help,
//              size: 100.0,
//              color: Colors.yellowAccent,
//            )
//          ],
//        ),
        child: new Text("$total",style: new TextStyle(fontSize: total+10.0),) ,
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'add',
          child: new Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: _onFloatActionButtonPressed,
      ),
    );
  }
}