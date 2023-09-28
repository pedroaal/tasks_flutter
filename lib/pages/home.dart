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
  String task = '';

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getTasks() async {
    final res = await findTasks();
    setState(() {
      tasks = res;
    });
  }

  void handleCreate() async {
    createTask(task);
    getTasks();
    _controller.clear();
    setState(() {
      task = '';
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
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'New Task',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      task = value;
                    });
                  },
                ),
              ),
              IconButton(
                  onPressed: handleCreate,
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.purple,
                    size: 32,
                    semanticLabel: 'Create task',
                  ))
            ]),
            const SizedBox(height: 16),
            Expanded(
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
            )
          ])),
    );
  }
}
