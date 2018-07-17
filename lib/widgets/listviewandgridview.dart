import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
      home: new ListViewApp(),
//      home: new GridViewApp(),
  ));
}
class GridViewApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GridViewStateApp();
  }

}
class GridViewStateApp extends State<GridViewApp>{
  List<GridItem> mList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<=20;i++){
      mList.add(new GridItem("蛋糕$i",Icons.cake));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView"),
      ),
      body: new GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              //列 数
              crossAxisCount: 3,
              //行间距
              mainAxisSpacing: 5.0,
              //列间距
              crossAxisSpacing: 5.0,
              //宽/高 比例
              childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index){
            return new GridItemWidget(mList[index]);
          },
          itemCount: mList.length,
      ),
    );
  }

}
class GridItem{
  String title;
  IconData iconData;

  GridItem(this.title, this.iconData);
}
class GridItemWidget extends StatelessWidget{
  GridItem gridItem;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      child: new Container(
        color: Colors.blue,
        child: new Column(
          //居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(gridItem.iconData,size: 50.0,),
            new Text(gridItem.title),
          ],
        ),
      ),
      onTap: (){
        
      },
    );
  }

  GridItemWidget(this.gridItem);

}


class ListViewApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListViewStateApp();
  }
}
class ListViewStateApp extends State<ListViewApp> {
  List<String> mlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<=20;i++){
      mlist.add("我是测试标题$i");
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
      ),
//      body: new ListView(
//        children: <Widget>[
//          new ListTile(
//            leading: new Icon(Icons.cake),
//            title: new Text("蛋糕"),
//          ),
//          new ListTile(
//            leading: new Icon(Icons.android),
//            title: new Text("Android"),
//          ),
//          new ListTile(
//            leading: new Icon(Icons.apps),
//            title: new Text('网格'),
//          ),
//          new ListTile(
//            leading: new Icon(Icons.account_circle),
//            title: new Text('用户'),
//          )
//        ],
//      ),
      body: new ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return new ListItem(mlist[index]);
          },
          //添加listView的条目个数  不然会渲染无数多个空白的条目
          itemCount:mlist.length ,
      )
    );
  }
}
class ListItem extends StatelessWidget{ // ignore: must_be_immutable

  var title = '条目';
  ListItem(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      leading: new Icon(Icons.cake),
      title: new Text(title),
      onTap: (){
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text(title),
        ));
      },
    );
  }
}