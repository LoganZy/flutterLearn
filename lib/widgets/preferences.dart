import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(home: new PreferencesApp(),));
}
class PreferencesApp extends StatelessWidget{
  final String _username = "username";
  final TextEditingController _usernameController = new TextEditingController();

  save() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_username, _usernameController.value.text.toString());
  }

  Future<String> get() async{
    var username;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.get(_username);
    return username;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Preferences App"),
        ),
        body: new Center(
          child: new Builder(builder: (BuildContext context){
            return new Column(
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.perm_identity),
                    labelText: "请输入姓名",
                    helperText: "注册时填写的姓名",
                    contentPadding: EdgeInsets.only(top: 10.0),
                  ),
                ),
                new Divider(
                  height: 30.0,
                ),
                RaisedButton(
                    child: new Text("点击保存"),
                    color: Colors.blueAccent,
                    onPressed: (){
                      save();
                      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("数据存储成功")));
                    }
                ),
                new Divider(
                  height: 30.0,
                ),
                new RaisedButton(
                    child: new Text("获取数据") ,
                    color: Colors.blueAccent,

                    onPressed: (){
                        Future<String> username = get();
                        username.then((String name){
                          Scaffold.of(context).showSnackBar(new SnackBar(content: Text("数据获取成功：$name")));
                        });
                    }
                ),

              ],
            );
          }),
        ),
    );
  }
}
