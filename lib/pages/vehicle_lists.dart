import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiman/pages/home.dart';

import '../pages/vehicle_data.dart';
import '../pages/profile.dart';
import '../pages/vehiedit.dart';
import '../pages/admin.dart';
import '../pages/vehiview.dart'; // Import VehiViewPage

class VehicleLists extends StatefulWidget {
  final String previousPage;

  VehicleLists({required this.previousPage});

  @override
  _VehicleListsState createState() => _VehicleListsState();
}

class _VehicleListsState extends State<VehicleLists> {
  late List<VehicleData> _vehicleDataList;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedData = prefs.getStringList('savedData');
    if (savedData != null) {
      setState(() {
        _vehicleDataList = savedData.map((data) => VehicleData.fromMap(jsonDecode(data))).toList();
      });
    } else {
      setState(() {
        _vehicleDataList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handleBackButtonPress(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black, size: 30.0),
            onPressed: () {},
          ),
          title: Center(
            child: Text(
              'VEHICLES',
              style: TextStyle(color: Colors.black),
            ),
          ),
          automaticallyImplyLeading: false,
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
        body: _vehicleDataList == null
            ? Center(child: CircularProgressIndicator())
            : _vehicleDataList.isEmpty
            ? Center(child: Text('No saved data available'))
            : ListView.builder(
          itemCount: _vehicleDataList.length,
          itemBuilder: (context, index) {
            VehicleData vehicleData = _vehicleDataList[index];
            return GestureDetector(
              onTap: () async {
                final updatedVehicleData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehiViewPage(previousPage: widget.previousPage, vehicleData: vehicleData),
                  ),
                );

                if (updatedVehicleData != null) {
                  setState(() {
                    _vehicleDataList[index] = updatedVehicleData;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  key: Key(vehicleData.id), // Add a unique key based on vehicle ID
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
      ),
    );
  }

  Future<bool> _handleBackButtonPress(BuildContext context) async {
    if (widget.previousPage == 'home') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (widget.previousPage == 'admin') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Admin()),
      );
    }
    return false; // Returning false allows the default back button behavior
  }
}
