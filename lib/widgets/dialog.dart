import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new DialogApp(),));
}
class DialogApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("SnackBar And Dialog"),
        ),
        body: new Center(
            child: new Column(
              children: <Widget>[
                new Divider(),
                new ShowSnack(),
                new Divider(),
                new DialogSimple(),
                new Divider(),
                new AlertDialogDemo(),
                new Divider(),
                new AboutDialogDemo(),
                new Divider(),
                new ShowBottomSheet(),
                new Divider(),
                new ShowModalBottomSheet(),
                new Divider(),
              ],
            )
        ));
  }
}
class ShowModalBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Builder(builder: (BuildContext context) {
      return new RaisedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context){
                return new Container(
                    child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.chat),
                              title: new Text("开始会话"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.help),
                              title: new Text("操作说明"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.settings),
                              title: new Text("系统设置"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.more),
                              title: new Text("更多设置"),
                            ),
                          ],
                        ))
                );
              }
          );
        },
        child: new Text("ShowModalBottomSheet"),
        color: Colors.blue,
        highlightColor: Colors.lightBlueAccent,
        disabledColor: Colors.lightBlueAccent,
      );
    });
  }
  
}
//
class ShowBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Builder(builder: (BuildContext context) {
      return new RaisedButton(
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (BuildContext context){
                return new Container(
                    child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.chat),
                              title: new Text("开始会话"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.help),
                              title: new Text("操作说明"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.settings),
                              title: new Text("系统设置"),
                            ),
                            new ListTile(
                              leading: new Icon(Icons.more),
                              title: new Text("更多设置"),
                            ),
                          ],
                        ))
                );
              }
          );
        },
        child: new Text("ShowBottomSheet"),
        color: Colors.blue,
        highlightColor: Colors.lightBlueAccent,
        disabledColor: Colors.lightBlueAccent,
      );
    });
  }
  
}
//AboutDialogDemo
class AboutDialogDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Builder(builder: (BuildContext context) {
      return new RaisedButton(
        onPressed: () {
         showAboutDialog(
           context: context,
           applicationIcon: new Icon(Icons.android,color: Colors.blueAccent,),
           applicationName: "AboutDialog",
           applicationVersion: '1.0.0',
           applicationLegalese: "hahahahahha",
           children: <Widget>[
             new Text("更新摘要\n新增飞天遁地功能\n优化用户体验")
           ],

         );
        },
        child: new Text("AboutDialog"),
        color: Colors.blue,
        highlightColor: Colors.lightBlueAccent,
        disabledColor: Colors.lightBlueAccent,
      );
    });
  }

}
//AlertDialog
class AlertDialogDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Builder(builder: (BuildContext context) {
      return new RaisedButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              child: new AlertDialog(
                title: new Text("AlertDialog"),
                content: new Text("这是一个AlertDialog"),
                contentPadding: EdgeInsets.only(left: 50.0,top: 0.0),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('ok')),
                  new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: new Text('close')),
                ],
              ),
          );
        },
        child: new Text("AlertDialog"),
        color: Colors.blue,
        highlightColor: Colors.lightBlueAccent,
        disabledColor: Colors.lightBlueAccent,
      );
    });
  }

}
//DialogSimple
class DialogSimple extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Builder(builder: (BuildContext context){
        return new RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                child: new SimpleDialog(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: new Text("我是标题"),
                  children: <Widget>[
                    new Text("我是内容区域，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈"),
                    new ListTile(
                      leading: new Icon(Icons.apps),
                      title: new Text("apps"),),

                    new ListTile(
                      leading: new Icon(Icons.android),
                      title: new Text("andrpid"),),

                    new ListTile(
                      leading: new Icon(Icons.cake),
                      title: new Text("cake"),),

                    new ListTile(
                      leading: new Icon(Icons.local_cafe),
                      title: new Text("cofe"),),
                  ],
                ));
          },
          child: new Text("DialogSimple"),
          color: Colors.blue,
          highlightColor: Colors.lightBlueAccent,
          disabledColor: Colors.lightBlueAccent,
      );
    });
  }

}

//SnackBar
class ShowSnack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Builder(builder: (BuildContext context) {
            return new RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("Snackbar"),
                  action: new SnackBarAction(
                    label: "撤回",
                    onPressed: () {},
                  ),
                ));
              },
              child: new Text("SnackBar"),
              color: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              disabledColor: Colors.lightBlueAccent,
            );
          });
  }
}