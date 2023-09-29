import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/screens/drawer_view.dart';

import '../blocs/taskbloc/tasks_bloc.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({super.key});

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;
        return Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chip(
                label: Text(
                  '${tasksList.length} Tasks',
                ),
              ),
              TaskList(taskList: tasksList),
            ],
          ),
        );
      },
    );
  }
}
