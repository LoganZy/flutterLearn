import 'package:flutter/material.dart';
import 'package:flutter_learn/zyIcons.dart' as fly;

void main(){
  runApp(new MaterialApp(
      home: new IconstestApp(),
  ));
}

class IconstestApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Icons'),
      ),
      body: new Center(
//        child: new Icon(Icons.android,size: 100.0,color: Colors.blue,),
        child: new Icon(fly.FaIcons.package,size: 100.0,color: Colors.blueAccent,),
      ),
    );
  }
  
}
