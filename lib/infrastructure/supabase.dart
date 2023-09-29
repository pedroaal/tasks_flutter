import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async {
  await Supabase.initialize(
    url: 'https://tdvwixtypvptjewsemwa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRkdndpeHR5cHZwdGpld3NlbXdhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2ODc3MDgsImV4cCI6MjAxMTI2MzcwOH0.12cypZrt5lbX4c1s2BU85Jefyr4EYjfWdl32gY7g334',
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;
