import 'package:flutter/material.dart';

void main() {
  runApp(OpacityApp());
}

class OpacityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OpHomePage(
        title: 'Opacity app',
      ),
    );
  }
}

class OpHomePage extends StatefulWidget {
  final String title;

  OpHomePage({Key key, this.title}) : super(key: key);

  @override
  _OpState createState() {
    return _OpState();
  }
}

class _OpState extends State<OpHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        child: Icon(Icons.flip),
      ),
    );
  }
}
