import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new LoginApp(),));
}

class LoginApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginStateApp();
  }

}
class LoginStateApp extends State<LoginApp>{

  TextEditingController _username = new TextEditingController();

  TextEditingController _password = new TextEditingController();

  BuildContext context1;

  @override
  Widget build(BuildContext context) {
    this.context1 = context;
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login App"),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            controller: _username,
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(
              labelText: "请输入用户名",
              icon: new Icon(Icons.perm_identity),
              helperText: '注册时填写的姓名'
            ),
            autofocus: false,
          ),
          new TextField(
            controller: _password,
            keyboardType: TextInputType.number,
            autofocus: false,
            decoration: new InputDecoration(
              labelText: '请输入密码',
              icon: new Icon(Icons.lock),
              helperText: '注册时填写的密码'
            ),
          ),
          new Builder(builder: (BuildContext context){
            return new RaisedButton(
              child: new Text("登录",style: new TextStyle(color: Colors.white),),
              color: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              disabledColor: Colors.lightBlueAccent,
              onPressed:(){
                if(_username.text.toString() == "zylaoshi" && _password.text.toString()=='123456'){
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('登录成功')));
                  print('登录成功');
                }else{
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("用户名或密码错误！")));
                  print("用户名或密码错误");
                }
                clearText();
              },
            );
          }),
        ],
      ),
    );
  }
  void clearText(){
    setState(() {
      _username.text = '';
      _password.text = '';
    });
  }

}