import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/task_item.dart';
import 'package:todo_app/components/todo_icon.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/task_model.dart';

final TaskModel todoBrain = TaskModel();

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String newTask;

  List<Widget> getTasks(tasks) {
    List<TaskItem> items = List<TaskItem>();
    for (var task in tasks) {
      items.add(TaskItem(task: task));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  decoration: kWhiteBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 30.0,
                      right: 30.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Add Task',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              newTask = value;
                            });
                          },
                        ),
                        MaterialButton(
                          child: Text("Add"),
                          color: Colors.lightBlueAccent,
                          onPressed: () {
                            Provider.of<TaskModel>(context).addTask(newTask);
                            Navigator.pop(context);
                          },
                          textColor: Colors.white,
                        )
                      ],
                    ),
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
              child: Consumer<TaskModel>(
                builder: (context, taskModel, child) => Text(
                  '${taskModel.tasks.length} $TASKS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
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
                      Consumer<TaskModel>(
                        builder: (context, taskModel, child) => Expanded(
                          child: ListView(
                            children: getTasks(taskModel.tasks),
                          ),
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
    );
  }
}
