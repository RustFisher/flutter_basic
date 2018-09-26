import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// @see https://flutter.io/cookbook/navigation/passing-data/

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todos = List.generate(
        20, (i) => Todo('Todo $i', 'description of todo item $i'));

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].title),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(todo: todos[index])));
                },
              );
            }),
      ),
    );
  }
}

/// Show details
class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${todo.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("${todo.description}"),
      ),
    );
  }
}
