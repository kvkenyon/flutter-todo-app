import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/task_item.dart';
import 'package:todo_app/components/todo_icon.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/TodoBrain.dart';

final TodoBrain todoBrain = TodoBrain();

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks;

  @override
  void initState() {
    super.initState();

    tasks = todoBrain.getTasks();
  }

  List<Widget> getTasks() {
    List<TaskItem> items = List<TaskItem>();
    for (var task in tasks) {
      items.add(TaskItem(task: task));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: Text(
                      "This is a modal bottom sheet",
                    ),
                  );
                },
              );
            },
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TodoIcon(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 40.0,
                ),
                child: Text(
                  APP_TITLE,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  bottom: 40.0,
                ),
                child: Text(
                  '${tasks.length} $TASKS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: kWhiteBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            children: getTasks(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
