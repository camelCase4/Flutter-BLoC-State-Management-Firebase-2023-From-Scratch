import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/services/id_generator.dart';

import '../blocs/taskbloc/tasks_bloc.dart';
import '../models/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;

  const EditTaskScreen({
    super.key,
    required this.oldTask,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);

    return Column(children: [
      const SizedBox(
        height: 5,
      ),
      const Text(
        'Edit Task',
        style: TextStyle(fontSize: 18),
      ),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      TextField(
        autofocus: true,
        controller: descriptionController,
        minLines: 3,
        maxLines: 5,
        decoration: const InputDecoration(
          label: Text('Description'),
          border: OutlineInputBorder(),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('cancel'),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              var editedTask = Task(
                title: titleController.text,
                description: descriptionController.text,
                id: oldTask.id,
                isDone: false,
                isFavourite: oldTask.isFavourite,
                date: DateTime.now().toString(),
              );
              context.read<TasksBloc>().add(
                    EditTask(
                      oldTask: oldTask,
                      newTask: editedTask,
                    ),
                  );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ]);
  }
}
