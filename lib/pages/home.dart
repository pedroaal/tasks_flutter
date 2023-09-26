import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:my_first_app/widgets/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _getTasks = Supabase.instance.client.from('tasks').select();

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
        child: FutureBuilder(
          future: _getTasks,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final tasks = snapshot.data!;

            return ListView.separated(
              itemCount: tasks.length,
              itemBuilder: ((context, index) {
                final task = tasks[index];
                return Task(
                  title: task['title'],
                  isDone: task['isDone'],
                );
              }),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 16),
            );
          },
        ),
      ),
    );
  }
}
