import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyCustomFormPage(),
    ));

class MyCustomFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<MyCustomFormPage> {
  final editingController = TextEditingController();
  final FocusNode tfNode = FocusNode();

  @override
  void initState() {
    super.initState();
    editingController.addListener(_printTextListener);
  }

  @override
  void dispose() {
    editingController.removeListener(_printTextListener);
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text field 1'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              focusNode: tfNode,
              controller: editingController,
            ),
            TextField(
              controller: editingController, // 同样的controller能控制多个view
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: GestureDetector(
                child: Text('Focus text field'),
                onTap: () {
                  FocusScope.of(context).requestFocus(tfNode);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('From text field'),
                  content: Text(editingController.text),
                );
              });
        },
        child: Icon(Icons.text_fields),
      ),
    );
  }

  _printTextListener() {
    print('text field: ${editingController.text}');
  }
}
