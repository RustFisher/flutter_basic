import 'package:flutter/material.dart';

/// 侧滑删除列表界面
class SwipeToDismissPage extends StatefulWidget {
  SwipeToDismissPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SwipeState();
  }
}

class SwipeState extends State<SwipeToDismissPage> {
  final items = List<String>.generate(20, (i) => "Item $i"); // 列表必须放在外面定义

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Swipe to dismiss",
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                  print(direction);
                });
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('remove $item')));
              },
              child: ListTile(
                title: Text('$item'),
              ),
              background: Container(
                color: Colors.red,
              ),
            );
          }),
    );
  }
}
