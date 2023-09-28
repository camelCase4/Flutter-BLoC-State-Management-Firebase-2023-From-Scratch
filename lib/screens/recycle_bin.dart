import 'package:flutter/material.dart';

import '../widgets/task_list.dart';
import 'drawer_view.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          drawer: const TaskDrawer(),
          body: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Chip(
                  label: Text(
                    'Tasks',
                    style:  TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.black12,
                ),
                TaskList(taskList: []),
                
              ],
            ),
          ),
        );
  }
}