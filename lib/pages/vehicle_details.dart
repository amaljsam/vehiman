import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:vehiman/pages/vehicle_data.dart';
import 'package:vehiman/pages/vehiedit.dart';
import 'package:vehiman/pages/profile.dart';
import '../pages/addvehi.dart';
import '../pages/admin.dart';

class VehicleDetails extends StatefulWidget {
  final String previousPage;

  VehicleDetails({required this.previousPage});

  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  late List<VehicleData> _vehicleList; // Initialize _vehicleList as an empty list

  @override
  void initState() {
    super.initState();
    _vehicleList = []; // Initialize _vehicleList as an empty list
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('savedData');
    if (savedData != null) {
      setState(() {
        _vehicleList = savedData.map((data) => VehicleData.fromMap(jsonDecode(data))).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to admin page when device back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Admin()), // Navigate to AdminPage
        );
        return true; // Return true to allow back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'MANAGE VEHICLES',
              style: TextStyle(color: Colors.black),
            ),
          ),
          automaticallyImplyLeading: false, // Remove default back button
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.black),
              iconSize: 40.0,
              onPressed: () {
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
        body: _vehicleList.isEmpty
            ? Center(child: Text('No saved data available'))
            : ListView.builder(
          itemCount: _vehicleList.length,
          itemBuilder: (context, index) {
            VehicleData vehicleData = _vehicleList[index];
            return GestureDetector(
              onTap: () async {
                final updatedVehicleData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehiEditPage(
                      previousPage: widget.previousPage,
                      vehicleData: vehicleData,
                      uniqueKey: UniqueKey(),
                    ),
                  ),
                );

                if (updatedVehicleData != null) {
                  setState(() {
                    _vehicleList[index] = updatedVehicleData;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.file(
                          File(vehicleData.imagePath),
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Vehicle Number: ${vehicleData.vehicleNumber}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                'Make: ${vehicleData.vehicleMake}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Model: ${vehicleData.vehicleModel}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Fuel Type: ${vehicleData.fuelType}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addvehi(previousPage: widget.previousPage)),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Positions the button in the bottom right corner
      ),
    );
  }
}
