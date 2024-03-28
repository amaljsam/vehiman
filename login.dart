import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _MainActivity2State createState() => _MainActivity2State();
}

class _MainActivity2State extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (_isValidLogin(username, password)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Login Confirmation"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, '/role');
                },
                child: Text('Correct'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Wrong'),
              ),
            ],
          );
        },
      );
    } else {
      _showToast('Invalid username or password!');
    }
  }

  bool _isValidLogin(String username, String password) =>
      username.isNotEmpty && password.isNotEmpty;

  void _showToast(String message) {
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
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Don\'t have an Account?',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
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
                        SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'PASSWORD',
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _login,
                          child: Text('LOGIN',style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/reset');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
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