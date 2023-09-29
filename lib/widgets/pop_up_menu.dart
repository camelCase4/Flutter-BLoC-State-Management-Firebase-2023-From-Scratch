import 'package:flutter/material.dart';

import '../models/task.dart';

class PopUpMenuDisplay extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;

  const PopUpMenuDisplay({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  onTap: () {},
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Add to Bookmarks'),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Delete'),
                  ),
                ),
              ])
          : (context) => [
                PopupMenuItem(
                  onTap: () {},
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text('Restore'),
                  ),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete'),
                  ),
                )
              ],
    );
  }
}
