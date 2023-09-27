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
  List? tasks;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Future<void> getTasks() async {
    var res = await Supabase.instance.client.from('tasks').select();
    setState(() {
      tasks = res as List;
    });
  }
  
  Future<void> updateTask(bool val, int id) async {
    await Supabase.instance.client
        .from('tasks')
        .update({'isDone': val}).match({'id': id});
    getTasks();
  }

  Future<void> deleteTask(int id) async {
    await Supabase.instance.client
        .from('tasks')
        .delete()
        .match({'id': id});
    getTasks();
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
          child: tasks != null ? ListView.separated(
            itemCount: tasks?.length ?? 0,
            itemBuilder: ((context, index) {
              final task = tasks![index];
              return Task(
                id: task['id'],
                title: task['title'],
                isDone: task['isDone'],
                onUpdate: (bool val) => updateTask(val, task['id']),
                onDelete: () => deleteTask(task['id']),
              );
            }),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 16),
          ) : const Center(
                child: Text("No Data Found"),
              ),),
    );
  }
}
