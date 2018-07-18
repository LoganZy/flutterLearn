import 'package:flutter/material.dart';
import 'widgets/intent.dart';
import 'widgets/initmyapp.dart';
import 'widgets/layout.dart';
import 'widgets/layout1.dart';
import 'widgets/statefulwidget.dart';
import 'widgets/container.dart';
import 'widgets/checkbox.dart';
import 'widgets/icon.dart';
import 'widgets/radio.dart';
import 'widgets/dialog.dart';
import 'login/login_page.dart';
import 'widgets/animation.dart';
import 'widgets/fileoperator.dart';
import 'widgets/httpconnect.dart';
import 'widgets/listviewandgridview.dart';
import 'widgets/platformchannel.dart';
import 'widgets/refreshandloadmore.dart';
import 'login/login.dart';
import 'widgets/preferences.dart';

class MainContent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainContentState();
  }

}

class MainContentState extends State<MainContent>{
  List<ListItem> mlist=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mlist.add(new ListItem("新建项目自带的demo", new MyApp()));
    mlist.add(new ListItem("StatefulWidget", new MyHome()));
    mlist.add(new ListItem("Layout常用", new LayoutApp()));
    mlist.add(new ListItem("Layout1常用", new Layout1App()));
    mlist.add(new ListItem("dialog使用", new DialogApp()));
    mlist.add(new ListItem("Container布局的使用", new ContainerTestApp()));
    mlist.add(new ListItem("icon使用", new IconstestApp()));
    mlist.add(new ListItem("Checkbox的使用", new CheckBoxApp()));
    mlist.add(new ListItem("Radio类型布局的使用", new RadioApp()));
    mlist.add(new ListItem("intent的跳转", new IntentApp()));
    mlist.add(new ListItem("login登录", new LoginApp()));
    mlist.add(new ListItem("Animation动画的使用", new AnimationApp()));
    mlist.add(new ListItem("login登录+动画", new LoginPage()));
    mlist.add(new ListItem("GridView和ListView使用", new GridViewApp()));
    mlist.add(new ListItem("下啦刷新+上推加载更多", new RefreshLoadApp()));
    mlist.add(new ListItem("Preferences的使用", new PreferencesApp()));
    mlist.add(new ListItem("FileOperator的操作", new FileOperator()));
    mlist.add(new ListItem("Http网络访问使用", new HttpConnect()));
    mlist.add(new ListItem("Android平台代码交互", new PlatFormChannel()));


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Flutter_learn"),
      ),
      body: new Center(
        child: new ListView.builder(
            itemBuilder: (BuildContext context,int index){
                return new ListItemWidget(mlist[index]);
            },
            itemCount: mlist.length,
        ),
      ) ,
    );
  }

}
class ListItem{
  String title;
  Widget widget;

  ListItem(this.title, this.widget);
}

class ListItemWidget extends StatelessWidget{
  ListItem listItem;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      alignment: Alignment.center ,
      color: Colors.blueAccent,
      margin: EdgeInsets.all(10.0),
      child: new ListTile(
        title: Text(listItem.title),
        onTap: (){
//        静态跳转
//         Navigator.of(context).pushNamed("/widgets/"+listItem.intentString);
          Navigator.of(context).push(new PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
              return listItem.widget;
            },
          ));
        },
      ),
    );
  }

  ListItemWidget(this.listItem);

}