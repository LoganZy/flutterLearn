import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(new MaterialApp(home: MyApp(),));
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyStateApp();
  }

}
class MyStateApp extends State<MyApp>{
  var netChangeed = "网路连接状态";
  static const platform = const MethodChannel("com.zylaoshi.flutterlearn/android");

  static const EventChannel eventChannel = const EventChannel("com.zylaoshi.flutterlearn/netChanged");

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }
  void _onEvent(Object event) {
    setState(() {
      netChangeed = event;
    });
  }
  void _onError(Object error){
    setState(() {
      netChangeed = "网络状态获取失败";
    });
  }

  Future<bool> isNetConnection() async{
    bool isConnection;
    try {
      isConnection = await platform.invokeMethod("netConnection");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return isConnection;
  }

  showToast(String msg) async{
    try{
      await platform.invokeMethod("showToast",{'msg':msg});
    }on PlatformException catch(e){
      print(e.toString());
    }

  }
  Future<String> getAndroidTime() async {
    var str;
    try {
      str = await platform.invokeMethod("getAndroidTime");
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return str;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("platformChannals"),
      ),
      body: Center(
        child:new Builder(builder: (BuildContext context){
          return new Column(
            children: <Widget>[

              new Container(
                child: RaisedButton(
                    child: Text("调用Android原生Toast"),
                    onPressed: (){
                      showToast("我是android系统的toast");
                    }
                ),
                margin: new EdgeInsets.only(top: 30.0),
              ),

              new Container(
                child: RaisedButton(
                    child: Text("点我获取Android平台数据"),
                    onPressed: (){
                      getAndroidTime().then((String str){
                        Scaffold.of(context).showSnackBar(new SnackBar(content:Text(str!=null?str:"获取失败")));
                      }).catchError((error) {
                        print(error.toString());
                      });
                    }
                ),
                margin: new EdgeInsets.only(top: 30.0),
              ),
              new Container(
                child: RaisedButton(
                    child: Text("判断是否连接网络"),
                    onPressed: (){
                      isNetConnection().then((bool isConnection){
                        showToast(isConnection ? "网络连接成功":"网络连接失败");
                      }).catchError((error) {
                        print(error.toString());
                      });
                    }
                ),
                margin: new EdgeInsets.only(top: 30.0),
              ),
              new Container(
                child: Text(netChangeed),
                margin: new EdgeInsets.only(top: 30.0),
              ),
            ],
          );
        }),
      ),
    );
  }



}