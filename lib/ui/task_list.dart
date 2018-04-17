import 'package:flutter/material.dart';

class TaskListWidget extends StatefulWidget {
  TaskListWidget({Key key}) : super(key: key);

  @override createState() => new _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {

  final todos = new List<String>.generate(5, (int index) => "Tests");

  Iterable<ListTile> _generateListTiles() {
    return todos.map((todo) => new ListTile(
      title: new Text(todo),
    ));
  }

  void _addTodo() {
    setState(() {
      todos.add("A new todo");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Scrit"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _generateListTiles().toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}