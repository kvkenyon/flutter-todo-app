class Task {
  String text;
  bool isComplete = false;

  Task(this.text);
}

class TodoBrain {
  List<Task> tasks = [Task('Task 1'), Task('Task 2'), Task('Task 3')];

  List<Task> getTasks() {
    return tasks;
  }

  void addTask(String todoText) {
    tasks.add(Task(todoText));
  }
}
