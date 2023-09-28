import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tasks_flutter/services/task.dart';

import 'package:tasks_flutter/widgets/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? tasks;

  Future<void> getTasks() async {
    final res = await findTasks();
    setState(() {
      tasks = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    getTasks();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: tasks != null
            ? ListView.separated(
                itemCount: tasks?.length ?? 0,
                itemBuilder: ((context, index) {
                  final task = tasks![index];
                  return Task(
                    id: task['id'],
                    title: task['title'],
                    isDone: task['isDone'],
                    refetch: getTasks,
                  );
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 16),
              )
            : const Center(
                child: Text("No Data Found"),
              ),
      ),
    );
  }
}
