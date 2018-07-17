import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(
      home: new RefreshLoadApp() ,
  ));
}
class RefreshLoadApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RefreshLoadStateApp();
  }

}

class RefreshLoadStateApp extends State<RefreshLoadApp>{
  bool isLoading = false;
  
  List<int> items = List.generate(16, (i) => i);
  ScrollController _scrollController = new ScrollController();

  var isLoadingMore;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("loadMore");
        _getMoreData();
      }
    });
  }
  Future _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
        isLoadingMore = 1.0;
      });
      List<int> newEntries = await mokeHttpRequest(items.length, items.length + 10);
      setState(() {
        items.addAll(newEntries);
        isLoading = false;
        isLoadingMore = 0.0;
      });
    }
  }
  Future<List<int>> mokeHttpRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("LoadMore"),
        ),
        body:  ListView.builder(
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index == items.length) {
              return _buildLoadText();
            } else {
              return ListTile(title: Text("Index$index"));
            }
          },
          controller: _scrollController,
        )
    );
  }
  Widget _buildLoadText() {
    return Container(child:  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Text("加载中……"),
      ),
    ),color: Colors.white70,);
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoadingMore ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

}