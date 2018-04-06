import 'package:flutter/material.dart';

class TaskListWidget extends StatefulWidget {
  TaskListWidget({Key key}) : super(key: key);

  @override createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scrit"),
      ),
//      body:
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}