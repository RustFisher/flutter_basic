import 'package:flutter/material.dart';

/// 手势检测示例界面
class HandlingGesturesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Handling gestures'),),
      body: Center(
        child: Column(children: <Widget>[
          new ButtonSample1(),
        ],),

      ),);
  }
}

/// 自定义button
class ButtonSample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Now you tap the $this"),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(color: Theme
            .of(context)
            .buttonColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Text("$this"),),
    );
  }

}