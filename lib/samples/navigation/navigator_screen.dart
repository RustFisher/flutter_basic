import 'package:flutter/material.dart';

/// 界面跳转demo
class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First page'), leading: new IconButton(
        icon: new Icon(Icons.arrow_back),
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },),
      ),
      body: Center(child: RaisedButton(
          child: Text('Go to 2nd page'),
          onPressed: () {
            print('This is first page');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          }),),);
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('${this} hashCode=${this.hashCode}');
    return Scaffold(appBar: AppBar(title: Text('Second page'),),
      body: Center(child: RaisedButton(
          child: Text("Go back"),
          onPressed: () {
            print('This is 2nd page');
            Navigator.pop(context);
          }),),);
  }
}