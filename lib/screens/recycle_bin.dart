import 'package:flutter/material.dart';

import '../blocs/taskbloc/tasks_bloc.dart';
import '../blocs/bloc_exports.dart';
import '../widgets/task_list.dart';
import 'drawer_view.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text('Recycle Bin'),
            actions: [
              // IconButton(
              //   onPressed: () {

              //   },
              //   icon: const Icon(Icons.add),
              // ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete all tasks'),
                    ),
                    onTap: () => context.read<TasksBloc>().add(
                          DeleteAllTasks(),
                        ),
                  )
                ],
              )
            ],
          ),
          drawer: const TaskDrawer(),
          body: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Chip(
                  label: Text(
                    '${state.removedTasks.length}Tasks',
                    style: const TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.black12,
                ),
                TaskList(taskList: state.removedTasks),
              ],
            ),
          ),
        );
      },
    );
  }
}
