import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:my_first_app/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://tdvwixtypvptjewsemwa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRkdndpeHR5cHZwdGpld3NlbXdhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2ODc3MDgsImV4cCI6MjAxMTI2MzcwOH0.12cypZrt5lbX4c1s2BU85Jefyr4EYjfWdl32gY7g334',
  );

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
