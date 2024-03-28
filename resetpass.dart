import 'package:flutter/material.dart';


class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
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
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'RESET PASSWORD',
                    style: TextStyle(fontSize: 36.0, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.email),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {

                            },
                            child: Text('RESET',style: TextStyle(color: Colors.black),),
                          ),
                        ],
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