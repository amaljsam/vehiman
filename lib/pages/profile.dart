import 'package:flutter/material.dart';
import 'package:vehiman/pages/login.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 108, 189, 181),
                Color.fromARGB(255, 200, 214, 191),
              ],
            ),
          ),
          child: AppBar(
            title: Text('User Profile'),
            backgroundColor: Colors.transparent, // make the AppBar transparent
            elevation: 0, // remove shadow
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 150.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle edit button press
                  },
                  child: Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // background color
                    foregroundColor: Colors.white, // text color
                    minimumSize:
                    Size(double.infinity, 50), // button width and height
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 108, 189, 181),
                        Color.fromARGB(255, 200, 214, 191),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle history button press
                    },
                    child: Text('History'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // background color
                      foregroundColor: Colors.white, // text color
                      shadowColor: Colors.transparent, // remove shadow
                      minimumSize:
                      Size(double.infinity, 50), // button width and height
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle logout button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // background color
                    foregroundColor: Colors.white, // text color
                    minimumSize:
                    Size(double.infinity, 50), // button width and height
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}