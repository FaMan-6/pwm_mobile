import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note/login_page.dart';
import 'package:supabase_note/note_page.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<void> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await supabase.auth.signUp(password: password, email: email);
      print('Auth success');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotePage(email: email)),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);
      print('Auth success');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotePage(email: email)),
      );
    } on AuthException catch (e) {
      if (e.message.contains('No user found for this email')) {
        print(e.message);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('User not found')));
      } else if (e.message.contains('Invalid')) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Email or Password is invalid')));
      } else {
        print(e.message);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    await supabase.auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
