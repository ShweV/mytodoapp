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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body : FutureBuilder<List<Todo>> (
            future: DatabaseHelper().retrieveTodos(),
            builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index];
                    return Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: Key(item.title),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          snapshot.data.removeAt(index);
                        });
                      },
                      // Show a red background as the item is swiped away.
                      background: Container(color: Colors.black87),
                      child: ListTile(
                        title: Text('$item.title'), tileColor: Colors.amber,),
                    );
                  },
                );
            }
        ),
      ),
    );
  }
}