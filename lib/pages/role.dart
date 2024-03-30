import 'package:flutter/material.dart';


class Role extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select Role',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, '/admin');
              },
              child: Text('Admin'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, '/user');
              },
              child: Text('User'),
            ),
          ],
        ),
      ),
    );
  }
}