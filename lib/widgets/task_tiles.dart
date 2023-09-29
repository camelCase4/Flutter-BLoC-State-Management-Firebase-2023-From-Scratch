import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/taskbloc/tasks_bloc.dart';
import '../models/task.dart';
import 'pop_up_menu.dart';

class TaskTiles extends StatelessWidget {
  const TaskTiles({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeOrDelete(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title.length > 10
                            ? '${task.title.substring(0, 10)}...'
                            : task.title,
                        style: TextStyle(
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(
                        //DateTime.now().toString(),
                        DateFormat('dd-MM-yyyy | hh:mm').format(DateTime.now()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              const SizedBox(
                width: 10,
              ),
              PopUpMenuDisplay(
                  task: task,
                  cancelOrDeleteCallback: () => _removeOrDelete(context, task)),
            ],
          )
        ],
      ),
    );
    // return ListTile(
    //   title: Text(
    //     task.title.length > 10 ? '${task.title.substring(0,10)}...':task.title,
    //     style: TextStyle(
    //       decoration: task.isDone! ? TextDecoration.lineThrough : null,
    //     ),
    //   ),
    //   trailing: Checkbox(
    //     value: task.isDone,
    //     onChanged: task.isDeleted == false
    //         ? (value) {
    //             context.read<TasksBloc>().add(UpdateTask(task: task));
    //           }
    //         : null,
    //   ),
    //   onLongPress: () => _removeOrDelete(context, task),
    // );
  }
}
