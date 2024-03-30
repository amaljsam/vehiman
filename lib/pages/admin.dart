import 'package:flutter/material.dart';
import 'package:vehiman/pages/damage.dart';
import 'package:vehiman/pages/manageuser.dart';
import 'package:vehiman/pages/managevehicles.dart';
import 'package:vehiman/pages/reserve.dart';
import 'package:vehiman/pages/status.dart';
import 'vehicles.dart';
import 'profile.dart';


class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black, size: 30.0),
          onPressed: () {
            // Handle menu icon press
          },
        ),

        automaticallyImplyLeading: false,
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
            _buildOptionButton(
              context,
              Icons.directions_car,
              'VEHICLES',
                  () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Vehicles(previousPage: 'admin')),
              ),
            ),

            _buildOptionButton(
              context,
              Icons.info,
              'STATUS',
                  () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Status(previousPage: 'admin')),
              ),
            ),
            _buildOptionButton(
              context,
              Icons.calendar_month,
              'RESERVE',
                  () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Reserve(previousPage: 'admin')),
              ),
            ),
            _buildOptionButton(
              context,
              Icons.warning,
              'DAMAGE',
                  () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Damage(previousPage: 'admin')),
              ),
            ),
            _buildOptionButton(
              context,
              Icons.supervised_user_circle,
              'MANAGE USERS',
                  () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Userman(previousPage: 'admin')),
              ),
            ),
            _buildOptionButton(
              context,
              Icons.car_crash,
              'MANAGE VEHICLES',
                  () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Vehicleman(previousPage: 'admin')),
              ),
            ),

            // Add other option buttons similarly
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, IconData icon, String label, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
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
              Icon(icon, color: Colors.black, size: 40.0),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
