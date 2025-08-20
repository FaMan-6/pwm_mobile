import 'package:flutter/material.dart';
import 'package:supabase_note/auth_service.dart';
import 'package:supabase_note/login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordPreview = true;
  bool confirmPreview = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Page')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordPreview ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed:
                      () => setState(() => passwordPreview = !passwordPreview),
                ),
              ),
              obscureText: passwordPreview,
            ),
            SizedBox(height: 10),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    confirmPreview ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed:
                      () => setState(() => confirmPreview = !confirmPreview),
                ),
              ),
              obscureText: confirmPreview,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("All fields are required")),
                  );
                  return;
                }

                String email = emailController.text;
                String password = passwordController.text;
                String confirmPassword = confirmPasswordController.text;

                if (password == confirmPassword) {
                  AuthService().signUp(email, password, context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Password doesn't match")),
                  );
                }
              },
              child: Text("Register"),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Already have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Login', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
