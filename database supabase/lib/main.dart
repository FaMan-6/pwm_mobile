import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note/auth_page.dart';

void main() {
  runApp(const MyApp());
  Supabase.initialize(
    url: 'https://cvfnvnllxnsccratkstk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN2Zm52bmxseG5zY2NyYXRrc3RrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQzNjM0MzUsImV4cCI6MjA2OTkzOTQzNX0.fLnYu2QiUdsNJdda37HBku9k2Z7lulLNHnUJLGZgGlM',
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
