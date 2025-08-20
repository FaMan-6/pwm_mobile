import 'package:flutter/material.dart';
import 'package:supabase_note/auth_page.dart';
import 'package:supabase_note/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordPreview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  onPressed:
                      () => setState(() => passwordPreview = !passwordPreview),
                  icon: Icon(
                    passwordPreview ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: passwordPreview,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All fields are required")),
                  );
                  return;
                }
                AuthService().signIn(
                  emailController.text,
                  passwordController.text,
                  context,
                );
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Don\'t have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AuthPage()),
                    );
                  },
                  child: Text('Regist', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Coming soon")));
              },
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
