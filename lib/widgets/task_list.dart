import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/bloc_exports.dart';

import '../models/task.dart';
import 'task_tiles.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return TaskTiles(task: task);
        },
      ),
    );
  }
}
