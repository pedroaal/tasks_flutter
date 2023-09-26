import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key, required this.title, required this.isDone});

  final String title;
  final bool isDone;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final _isDone = false;

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
            value: _isDone,
            onChanged: (value) {},
            splashRadius: 8,
          ),
          Text(
            widget.title,
            style: TextStyle(
                decoration: _isDone ? TextDecoration.lineThrough : null,
                fontSize: 20),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 24,
              semanticLabel: 'Delete task',
            ),
          ),
        ],
      ),
    );
  }
}
