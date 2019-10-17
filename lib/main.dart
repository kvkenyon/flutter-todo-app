import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';

import 'screens/todo_screen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        builder: (context) => TaskModel(),
        child: MaterialApp(
          home: TodoScreen(),
        ),
      ),
    );
