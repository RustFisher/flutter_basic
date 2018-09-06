import 'package:flutter/material.dart';
import 'package:flutter_basic/samples/gestures/swipe_to_dismiss_page.dart';

/// 手势检测示例界面
class HandlingGesturesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Handling gestures'),),
      body: Center(
        child: Column(children: <Widget>[
          new ButtonSample1("Swipe to dismiss demo"),
          new ButtonSample2(),
          new RaisedButton(onPressed: () {
            print("click $this");
          }, child: Text("RaisedButton"),),
          new FlatButton(onPressed: () {
            print("click $this");
          }, child: Text("FlatButton"),),
        ],),

      ),);
  }
}

/// 自定义button
class ButtonSample1 extends StatelessWidget {
  var _text = "";

  ButtonSample1(text) {
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => (SwipeToDismissPage())));
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(color: Theme
            .of(context)
            .buttonColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Text(_text),),
    );
  }

}

/// 带有波纹效果的按钮
class ButtonSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final snackBar = SnackBar(content: Text("Now you tap the $this"),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text("$this"),
      ),
    );
  }
}