import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  const TaskItem({
    @required this.task,
  });

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.task.text,
          style: widget.task.isComplete
              ? TextStyle(
                  fontSize: 25.0,
                  decoration: TextDecoration.lineThrough,
                )
              : TextStyle(fontSize: 25.0),
        ),
        Checkbox(
          value: widget.task.isComplete,
          onChanged: (value) {
            print(value);
            setState(() {
              widget.task.isComplete = value;
            });
          },
        ),
      ],
    );
  }
}
