import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimationStateApp();
  }

}
class AnimationStateApp extends State<AnimationApp> with SingleTickerProviderStateMixin{
  Animation<double> doubleAnimation;
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(vsync: this,duration: const Duration(milliseconds: 2000));
    doubleAnimation = new Tween(begin: 0.0,end: 300.0).animate(animationController)..addListener((){
      print(doubleAnimation.value);
      setState(() {

      });
    })..addStatusListener((status){
      if(status == AnimationStatus.forward){

      }else if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Animation App"),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed:onStartAnmiation,
          child: new AnnimationText(animation: doubleAnimation,),
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: doubleAnimation.value,
          width: doubleAnimation.value,
          child: new FlutterLogo(),
        ),
      ),

    );
  }
  onStartAnmiation(){
    animationController.forward(from: 0.0);
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }


}
class AnnimationText extends AnimatedWidget{
  AnnimationText({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Text(animation.value.toInt().toString());
  }

}
void main(){
  runApp(new MaterialApp(home: new AnimationApp(),));
}