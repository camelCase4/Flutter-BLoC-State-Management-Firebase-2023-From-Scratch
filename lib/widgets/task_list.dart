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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTiles(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Text\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: task.title),
                        const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: task.description),
                        const TextSpan(text: '\n')
                      ],
                    )),
                  )))
              .toList(),
        ),
      ),
    );
  }
}


// Expanded(
//       child: ListView.builder(
//         itemCount: taskList.length,
//         itemBuilder: (context, index) {
//           var task = taskList[index];
//           return TaskTiles(task: task);
//         },
//       ),
//     );