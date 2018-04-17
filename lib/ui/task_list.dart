import 'package:flutter/material.dart';

class TaskListWidget extends StatefulWidget {
  TaskListWidget({Key key}) : super(key: key);

  @override createState() => new _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {

  final _todos = new List<String>();
  bool _isAdding = false;

  Iterable<ListTile> _generateListTiles() {
    return _todos.map((todo) => new ListTile(
      title: new Text(todo),
    ));
  }

  void _showAddTodoInput() {
    setState(() {
      _isAdding = true;
    });
  }

  void _addTodo(String todoName) {
    setState(() {
      _todos.add(todoName);
      _isAdding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: _isAdding ? new TextField(
          autofocus: true,
          onSubmitted: _addTodo,
        ) : new Text("Scrit"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _generateListTiles().toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _showAddTodoInput,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}