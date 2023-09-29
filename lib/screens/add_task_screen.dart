import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/services/id_generator.dart';

import '../blocs/taskbloc/tasks_bloc.dart';
import '../models/task.dart';

class AddTaskHud extends StatelessWidget {
  const AddTaskHud({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Column(children: [
      const SizedBox(
        height: 5,
      ),
      const Text(
        'Add Task',
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
              var task = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                  id: GUIDGen.generate());

              context.read<TasksBloc>().add(AddTask(task: task));
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    ]);
  }
}
