import 'package:flutter/material.dart';

import 'package:tasks_flutter/infrastructure/supabase.dart';

import 'package:tasks_flutter/application/home.dart';

Future<void> main() async {
  await initSupabase();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Tasks'),
    );
  }
}
