import 'package:flutter/material.dart';
import 'package:flutter_basic/samples/navigation/navigator_screen.dart';
import 'package:flutter_basic/samples/gestures/handling_gestures.dart';
import 'package:flutter_basic/samples/navigation/returning_data_page.dart';
import 'package:flutter_basic/samples/navigation/todo_pages.dart';
import 'package:flutter_basic/samples/networking/fetching_data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _defColor = Color.fromARGB(255, 0, 0, 0);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new MaterialButton(
              onPressed: () {
                print("跳转去示例界面");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (FirstScreen())));
              },
              child: new Text("Navigation sample"),
              textColor: _defColor,
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (HandlingGesturesPage())));
              },
              child: new Text("Handling gestures"),
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (ReturningDataScreen())));
              },
              child: new Text("Returning data from page"),
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (FetchingDataPage1())));
              },
              child: new Text("获取数据"),
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (TodoListScreen())));
              },
              child: new Text("Todo List Demo"),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Increment',
        child: new Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
