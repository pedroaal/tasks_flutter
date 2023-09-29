import 'package:flutter/material.dart';

import 'package:tasks_flutter/domain/task.dart';

class Task extends StatefulWidget {
  const Task(
      {super.key,
      required this.id,
      required this.title,
      required this.isDone,
      required this.refetch});

  final int id;
  final String title;
  final bool isDone;
  final Future<void> Function() refetch;

  @override
  State<Task> createState() => TaskState();
}

class TaskState extends State<Task> {
  void handleDone(bool? val) async {
    final tmp = val ?? false;
    updateTask(tmp, widget.id);
    widget.refetch();
  }

  void handleDelete() async {
    deleteTask(widget.id);
    widget.refetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: widget.isDone,
            onChanged: handleDone,
            splashRadius: 8,
          ),
          Text(
            widget.title,
            style: TextStyle(
                decoration: widget.isDone ? TextDecoration.lineThrough : null,
                fontSize: 20),
          ),
          const Spacer(),
          IconButton(
              onPressed: handleDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 24,
                semanticLabel: 'Delete task',
              ))
        ],
      ),
    );
  }
}
