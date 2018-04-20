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

  /// replace the todo in the list with the given
  /// one by id
  void _updateTodo(final TodoItem todo) {
    setState(() {
      final index = _todos.indexWhere((item) => item.id == todo.id);
      _todos[index] = todo;
    });
  }

  void _onCheckboxChanged(final TodoItem todo, final bool isComplete) {
    _updateTodo(todo.copy(isComplete: isComplete));
  }

  void _changeToEditMode(final TodoItem todo) {
    _updateTodo(todo.copy(isInEditMode: !todo.isInEditMode));
  }

  void _delete(final TodoItem todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  Iterable<ListTile> _generateListTiles() {
    return _todos.map((todo) {

      final text = new Text(
        todo.title,
        style: new TextStyle(
            fontStyle: todo.isComplete ? FontStyle.italic : FontStyle.normal),
      );

      return new ListTile(
        title: !todo.isComplete ? text : new Stack(
          children: <Widget>[
            text,
            new Positioned.fill(
              left: 0.0,
              right: 0.0,
              child: new Divider(color: Colors.black),
            )
          ],
        ),
        trailing: todo.isInEditMode ? new IconButton(
            icon: new Icon(Icons.delete),
            onPressed: () { _delete(todo); }
        ) : new Checkbox(
          value: todo.isComplete,
          onChanged: (bool newValue) {
            _onCheckboxChanged(todo, newValue);
          },
        ),
        onLongPress: () { _changeToEditMode(todo); },
      );
    });
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