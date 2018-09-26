import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:async';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    title: 'File Demo',
    home: HomePage(counterStorage: CounterStorage(),),
  ));
}

class CounterStorage {
  Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      File file = await _localFile;
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    File file = await _localFile;
    return file.writeAsString('$counter');
  }
}

class HomePage extends StatefulWidget {
  final CounterStorage counterStorage;

  HomePage({Key key, @required this.counterStorage}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.counterStorage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  void _increaseCounter() async {
    setState(() {
      _counter++;
    });
    widget.counterStorage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$_counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
