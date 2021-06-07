import 'package:MyToDoApp/databases/DatabaseHelper.dart';
import 'package:MyToDoApp/databases/Todo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class TaskList extends StatefulWidget {
  TaskList({Key key}) : super(key: key);

  @override
  TaskListState createState() {
    return TaskListState();
  }
}

class TaskListState extends State<TaskList> {
  static String item;
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body : ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(items[index]),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.black87),
              child: ListTile(
                title: Text('$item.title'), tileColor: Colors.amber,),
            );
          },
        ),
      ),
    );
  }
}