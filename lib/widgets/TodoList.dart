import 'package:MyToDoApp/widgets/TaskList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  TodoListState createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    final title = 'Personal List';

    DateTime currentDate = DateTime.now();
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column (
          children: [
            TextField(
              decoration: InputDecoration(fillColor: Colors.orange, filled: true),
              textInputAction: TextInputAction.done,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 10),
              ),
              onPressed: () {
                print(Text(myController.text));
                _selectDate(context);
              },
              child: const Text('set reminder'),
            ),
            Center(
            child :TaskList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
}