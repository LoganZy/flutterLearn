
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new RadioApp(),));
}

class RadioApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RadioStateApp();
  }

}
class RadioStateApp extends State<RadioApp> {
  var radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }
  bool _isSwitchSelected = false;

  onChangeSwitchSelected(bool isSwitchSelected){
    setState(() {

      _isSwitchSelected = isSwitchSelected;
    });
  }
  var currentposition = 0.2;

  onSliderChange(double positon){
    setState(() {
      currentposition = positon;
    });

  }
  var _isCheckBoxListTileSelected = false;
  onCheckBoxListTileSelected(bool isCheckBoxListTileSelected){
    setState(() {
      _isCheckBoxListTileSelected = isCheckBoxListTileSelected;
    });
  }

  var _radioListTileValue = 0;
  onRadioListTileChangeValue(int radioListTileValue){
    setState(() {
      _radioListTileValue = radioListTileValue;
    });
  }

  var _isSwitchListTile = false;
  onSwitchListTileSelceted(bool isSwitchListTile){
    setState(() {
      _isSwitchListTile = isSwitchListTile;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("radio app"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Radio(value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
            new Radio(value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
            new Radio(value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
//            new Radio(value: 3, groupValue: radioValue, onChanged: handleRadioValueChanged),
            new Switch(value: _isSwitchSelected, onChanged: onChangeSwitchSelected),
            new Slider(value: currentposition, onChanged: onSliderChange,label: '进度条',),
            new Divider(height: 1.0,color: Colors.grey,),
            new CheckboxListTile(
                secondary:new Icon(Icons.update,color: Colors.blueAccent,),
                title: new Text('新版本自动下载'),
                subtitle: new Text("仅在WiFi环境下生效"),
                value: _isCheckBoxListTileSelected, 
                onChanged: onCheckBoxListTileSelected,
            ),
            new Divider(height: 1.0,color: Colors.grey,),
            new RadioListTile(controlAffinity:ListTileControlAffinity.trailing,secondary:new Icon(Icons.timer,color: Colors.blueAccent,),title: new Text("定时提醒间隔"),subtitle: new Text("10分钟"),value: 0, groupValue: _radioListTileValue, onChanged: onRadioListTileChangeValue),
            new RadioListTile(controlAffinity:ListTileControlAffinity.trailing,secondary:new Icon(Icons.timer,color: Colors.blueAccent,),title: new Text("定时提醒间隔"),subtitle: new Text("30分钟"),value: 1, groupValue: _radioListTileValue, onChanged: onRadioListTileChangeValue),
            new RadioListTile(controlAffinity:ListTileControlAffinity.trailing,secondary:new Icon(Icons.timer,color: Colors.blueAccent,),title: new Text("定时提醒间隔"),subtitle: new Text("60分钟"),value: 2, groupValue: _radioListTileValue, onChanged: onRadioListTileChangeValue),
            new Divider(height: 1.0,color: Colors.grey,),
            new SwitchListTile(secondary:new Icon(Icons.message,color: Colors.blueAccent,),title:new Text('新消息提醒') ,subtitle:new Text("点击切换") ,value: _isSwitchListTile, onChanged: onSwitchListTileSelceted)
          ],
        ),
      ),
    );
  }

}