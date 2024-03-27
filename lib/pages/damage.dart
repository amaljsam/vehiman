import 'package:flutter/material.dart';
import 'home.dart';
import 'admin.dart';
import 'profile.dart';

class Damage extends StatelessWidget {
  final String previousPage;

  Damage({required this.previousPage});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Intercept back button press event
        return _handleBackButtonPress(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black, size: 30.0),
            onPressed: () {
              // Handle menu icon press
            },
          ),
          title: Center(
            child: Text(
              'DAMAGES',
              style: TextStyle(color: Colors.black), // Change title text color to black
            ),
          ),          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black,),
              iconSize: 40.0,
              onPressed: () {
                // Navigate to the Profile page when the icon is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                );
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 108, 189, 181),
                  Color.fromARGB(255, 200, 214, 191)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: <Widget>[
              // Your grid items...
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _handleBackButtonPress(BuildContext context) async {
    if (previousPage == 'home') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (previousPage == 'admin') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Admin()),
      );
    }
    return false; // Returning false allows the default back button behavior
  }
}
