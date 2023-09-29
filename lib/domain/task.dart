import 'package:tasks_flutter/infrastructure/supabase.dart';

Future<List> findTasks() async {
  final res = await supabase.from('tasks').select().order('id');
  return res as List;
}

void createTask(String val) async {
  await supabase.from('tasks').insert({'title': val});
}

void updateTask(bool val, int id) async {
  await supabase.from('tasks').update({'isDone': val}).match({'id': id});
}

void deleteTask(int id) async {
  await supabase.from('tasks').delete().match({'id': id});
}
