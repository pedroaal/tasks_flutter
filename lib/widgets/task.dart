import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Task extends StatefulWidget {
  const Task(
      {super.key, required this.id, required this.title, required this.isDone, required this.onUpdate, required this.onDelete});

  final int id;
  final String title;
  final bool isDone;
  final Future<void> Function(bool) onUpdate;
  final Future<void> Function() onDelete;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  void _handleDone(bool? val) async {
    final tmp = val ?? false;
    widget.onUpdate(tmp);
  }

  void _handleDelete() async {
    widget.onDelete();
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
            onChanged: _handleDone,
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
              onPressed: _handleDelete,
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
