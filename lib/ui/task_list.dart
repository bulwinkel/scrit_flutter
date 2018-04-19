import 'package:flutter/material.dart';
import 'package:scrit_flutter/ui/todo_item.dart';

class TaskListWidget extends StatefulWidget {
  TaskListWidget({Key key}) : super(key: key);

  @override createState() => new _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {

  final List<TodoItem> _todos = new List<TodoItem>();
  bool _isAdding = false;
  String _nextTodoItem = "";

  void _updateNextTodoItem(String changedText) {
    _nextTodoItem = changedText;
  }

  void _onCheckboxChanged(final TodoItem todo, final bool isComplete) {
    final index = _todos.indexOf(todo);
    final updatedTodo = todo.copy(isComplete: isComplete);
    setState(() {
      _todos[index] = updatedTodo;
    });
  }

  Iterable<ListTile> _generateListTiles() {
    return _todos.map((todo) => new ListTile(
      title: new Text(
        todo.title,
        style: new TextStyle(fontStyle: todo.isComplete ? FontStyle.italic : FontStyle.normal),
      ),
      trailing: new Checkbox(
        value: todo.isComplete,
        onChanged: (bool newValue) {
          _onCheckboxChanged(todo, newValue);
        },
      )
    ));
  }

  void _addTodoIfValid() {
    if (_nextTodoItem.isNotEmpty) {
      _todos.insert(0, new TodoItem(title: _nextTodoItem));
      _nextTodoItem = "";
    }
  }

  void _showAddTodoInput() {
    setState(() {
      if (_isAdding) {
        _addTodoIfValid();
      } else {
        _isAdding = true;
      }
    });
  }

  void _addTodo(String todoName) {
    setState(() {
      _addTodoIfValid();
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
          onChanged: _updateNextTodoItem,
          controller: new TextEditingController(text: _nextTodoItem),
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