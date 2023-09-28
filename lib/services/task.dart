import 'package:supabase_flutter/supabase_flutter.dart';

Future<List> findTasks() async {
  final res = await Supabase.instance.client.from('tasks').select().order('id');
  return res as List;
}

void createTask(String val) async {
  await Supabase.instance.client.from('tasks').insert({'title': val});
}

void updateTask(bool val, int id) async {
  await Supabase.instance.client
      .from('tasks')
      .update({'isDone': val}).match({'id': id});
}

void deleteTask(int id) async {
  await Supabase.instance.client.from('tasks').delete().match({'id': id});
}
