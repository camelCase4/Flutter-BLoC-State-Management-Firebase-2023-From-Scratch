import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/screens/drawer_view.dart';

import '../blocs/taskbloc/tasks_bloc.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chip(
                label: Text(
                  '${state.pendingTasks.length} Pending | ${state.completedTasks.length} completed',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TaskList(taskList: tasksList),
            ],
          ),
        );
      },
    );
  }
}