import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isValidEmail(String email) =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  void _registerUser() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if ([username, email, password, confirmPassword].any((element) => element.isEmpty)) {
      showToast("All fields are required");
      return;
    }

    if (!_isValidEmail(email)) {
      showToast("Invalid email format");
      return;
    }

    if (password != confirmPassword) {
      showToast("Passwords do not match");
      return;
    }

    showToast("Registering");
  }

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    child: TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: 'USERNAME',
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.person),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'EMAIL',
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.email),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'PASSWORD',
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: 'CONFIRM PASSWORD',
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: _registerUser,
                          child: Text('REGISTER NOW',style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}