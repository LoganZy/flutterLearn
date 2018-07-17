import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new CheckBoxApp(),));
}

class CheckBoxApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CheckBoxStateApp();
  }

}
class CheckBoxStateApp extends State<CheckBoxApp>{
  bool _isChecked = false;

  onCheckChange(bool isChecked){
    setState(() {
      _isChecked = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("CheckBox App"),
      ),
      body: new Center(
        child: new Checkbox(value: _isChecked, onChanged:onCheckChange),
      ),
    );
  }

}