import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(appBar: AppBar(
  automaticallyImplyLeading: false,
  backgroundColor: Colors.transparent,
  foregroundColor: Colors.white,
  actions: <Widget>[
  IconButton(
  icon: Icon(Icons.account_circle, color: Colors.black, size: 40.0),
  onPressed: () {

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
  ElevatedButton(
  style: ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  ),
  elevation: 0,
  padding: EdgeInsets.zero,
  ),
  onPressed: () {

  },
  child: Ink(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
  colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  ),
  ),
  child: Container(
  width: double.infinity,
  height: double.infinity,
  alignment: Alignment.center,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Icon(Icons.directions_car, color: Colors.black, size: 40.0),
  SizedBox(width: 8),
  Text(
  'VEHICLES',
  style: TextStyle(color: Colors.black),
  ),
  ],
  ),
  ),
  ),
  ),
  ElevatedButton(
  style: ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  ),
  elevation: 0,
  padding: EdgeInsets.zero,
  ),
  onPressed: () {

  },
  child: Ink(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
  colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  ),
  ),
  child: Container(
  width: double.infinity,
  height: double.infinity,
  alignment: Alignment.center,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Icon(Icons.info, color: Colors.black, size: 40.0),
  SizedBox(width: 8),
  Text(
  'STATUS',
  style: TextStyle(color: Colors.black),
  ),
  ],
  ),
  ),
  ),
  ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {

      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event_available, color: Colors.black, size: 40.0),
              SizedBox(width: 8),
              Text(
                'RESERVE',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ),
  ElevatedButton(
  style: ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  ),
  elevation: 0,
  padding: EdgeInsets.zero,
  ),
  onPressed: () {
  },
  child: Ink(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
  colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  ),
  ),
  child: Container(
  width: double.infinity,
  height: double.infinity,
  alignment: Alignment.center,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Icon(Icons.warning, color: Colors.black, size: 40.0),
  SizedBox(width: 8),
  Text(
  'DAMAGE',
  style: TextStyle(color: Colors.black),
  ),
  ],
  ),
  ),
  ),
  ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 108, 189, 181), Color.fromARGB(255, 200, 214, 191)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Colors.black, size: 40.0), // Updated icon for MANAGE USERS
              SizedBox(width: 8),
              Text(
                'MANAGE USERS',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 108, 189, 181),
              Color.fromARGB(255, 200, 214, 191)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_car, color: Colors.black, size: 40.0),
                  SizedBox(width: 0),
                  Icon(Icons.directions_car, color: Colors.black, size: 40.0),
                  SizedBox(width: 0),
                  Icon(Icons.directions_car, color: Colors.black, size: 40.0),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'MANAGE VEHICLES',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ),


  ],
  ),
  ),
  );
  }
  }

