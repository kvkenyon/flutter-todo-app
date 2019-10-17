import 'dart:collection';

import 'package:flutter/foundation.dart';

class Task {
  String text;
  bool isComplete = false;

  Task(this.text);
}

class TaskModel extends ChangeNotifier {
  final List<Task> _tasks = [Task('Task 1'), Task('Task 2'), Task('Task 3')];

  // Provide unmodifiable view of the list
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String todoText) {
    _tasks.add(Task(todoText));
    notifyListeners();
  }
}
