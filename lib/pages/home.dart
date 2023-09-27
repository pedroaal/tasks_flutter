import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tasks_flutter/widgets/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? _tasks;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Future<void> getTasks() async {
    var res = await Supabase.instance.client.from('tasks').select();
    setState(() {
      _tasks = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: ListView.separated(
            itemCount: _tasks.length,
            itemBuilder: ((context, index) {
              final task = _tasks[index];
              return Task(
                id: task['id'],
                title: task['title'],
                isDone: task['isDone'],
              );
            }),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 16),
          )),
    );
  }
}
