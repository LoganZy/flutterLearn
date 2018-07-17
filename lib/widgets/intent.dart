import 'package:flutter/material.dart';
import 'page2.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(
      home: new IntentApp(),
      routes:  <String, WidgetBuilder>{
        '/page2': (BuildContext context) => new Page2("I am from intent app"),
      },
  ));
}
class IntentApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Intent App"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('点击跳转'),
            color: Colors.blue,
            highlightColor: Colors.lightBlue,
            onPressed: (){
              //静态跳转
//              Future f = Navigator.of(context).pushNamed("/page2");

              Future future = Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                      return new Page2("some attrs you like");
                  },
              ));

              future.then((value){
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text(value),
                    ));
              });
            }
        ),
      ),
    );
  }

}
