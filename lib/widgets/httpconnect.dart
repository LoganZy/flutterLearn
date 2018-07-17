import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  User user;

  void getUserInfo(String userName) {
    http.get("https://api.github.com/users/$userName").then((respsone) {
      setState(() {
        final responseJson = json.decode(respsone.body);
        user = new User.fromJson(responseJson);
        print(user.avatar_url);
      });
    }).catchError((error) {
      print(error.toString());
    }).whenComplete(() {
      print("请求完成");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("网络操作"),
      ),
      body: new SingleChildScrollView(child: Column(
        children: <Widget>[
          new Container(
            child: Image.network(user != null
                ? user.avatar_url
                : "https://avatars1.githubusercontent.com/u/6630762?v=4"),width: 50.0,height: 50.0,
          ),
          new ListTile(
            leading: Icon(Icons.person),
            title: Text("name:" + (user != null &&user.name!=null ? user.name : "暂无")),
          ),
          new ListTile(
            leading: Icon(Icons.location_city),
            title: Text("location:" + (user != null &&user.location!=null? user.location : "暂无")),
          ),
          new ListTile(
              leading: Icon(Icons.web),
              title: Text("blog:" + (user != null &&user.blog!=null? user.blog : "暂无"))),
          new ListTile(
            leading: Icon(Icons.http),
            title: Text("html_url:" + (user != null&&user.html_url!=null ? user.html_url : "暂无")),
          ),
          new Container(
            child:  new TextField(
              decoration: InputDecoration(labelText: "请输入你的github用户名"),
              controller: controller,
            ),
            padding: new EdgeInsets.only(left: 16.0),
            margin: new EdgeInsets.only(top: 20.0,bottom: 20.0),
          ),
          RaisedButton(
            onPressed: () {
              getUserInfo(controller.text.toString());
            },
            child: Text("Get请求"),
          ),
        ],
      ),),
    );
  }
}

class User {
  final String name;
  final String location;
  final String blog;
  final String avatar_url;
  final String html_url;

  User({this.name,this.location, this.blog, this.avatar_url, this.html_url});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      name: json['name'],
      location: json['location'],
      blog: json['blog'],
      avatar_url: json['avatar_url'],
      html_url: json['html_url'],
    );
  }
}