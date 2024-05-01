import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'vehicle_data.dart';
import 'vehicle_details.dart';
import 'profile.dart';

class Addvehi extends StatefulWidget {
  final String previousPage;

  Addvehi({required this.previousPage});

  @override
  _AddvehiState createState() => _AddvehiState();
}

class _AddvehiState extends State<Addvehi> {
  File? _image;
  bool _isSaveButtonEnabled = false;
  TextEditingController _vehicleNumberController = TextEditingController();
  TextEditingController _vehicleMakeController = TextEditingController();
  TextEditingController _vehicleModelController = TextEditingController();
  String _selectedFuelType = 'Petrol'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black, size: 30.0),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'ADD VEHICLE',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image == null
                  ? Text('No image selected.')
                  : SizedBox(
                width: 200,
                height: 200,
                child: Image.file(
                  _image!,
                  fit: BoxFit.cover,
                ),
              ),
              ElevatedButton(
                onPressed: _showImageSourceDialog,
                child: Text('Pick Image'),
              ),
              SizedBox(height: 20),
              // Text box for vehicle number
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _vehicleNumberController,
                  onChanged: (_) {
                    setState(() {
                      _isSaveButtonEnabled = _checkSaveButtonEnabled();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Vehicle Number',
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Text box for vehicle make
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _vehicleMakeController,
                  onChanged: (_) {
                    setState(() {
                      _isSaveButtonEnabled = _checkSaveButtonEnabled();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Vehicle Make',
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Text box for vehicle model
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _vehicleModelController,
                  onChanged: (_) {
                    setState(() {
                      _isSaveButtonEnabled = _checkSaveButtonEnabled();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Vehicle Model',
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Dropdown for fuel type
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton<String>(
                  value: _selectedFuelType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedFuelType = newValue!;
                      _isSaveButtonEnabled = _checkSaveButtonEnabled();
                    });
                  },
                  items: <String>['Petrol', 'Diesel']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSaveButtonEnabled ? _onSaveButtonPressed : null,
                child: Text('Save'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _goToVehicleDetails,
                child: Text('View'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showImageSourceDialog() async {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Add from Gallery'),
              onTap: () async {
                await _checkPermissions();
                _getImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a Pic'),
              onTap: () async {
                await _checkPermissions();
                _getImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _checkPermissions() async {
    if (await Permission.camera.request().isGranted &&
        await Permission.storage.request().isGranted) {
      // Both camera and storage permissions are granted.
    } else {
      // Permissions are not granted. Handle accordingly.
      print("Permissions not granted");
    }
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: source,
      maxHeight: 800, // Set maxHeight to limit the size of the image
      maxWidth: 800, // Set maxWidth to limit the size of the image
    );

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _isSaveButtonEnabled = _checkSaveButtonEnabled();
      } else {
        print('No image selected.');
        _isSaveButtonEnabled = false;
      }
    });
  }

  bool _checkSaveButtonEnabled() {
    return _image != null &&
        _vehicleNumberController.text.isNotEmpty &&
        _vehicleMakeController.text.isNotEmpty &&
        _vehicleModelController.text.isNotEmpty &&
        _selectedFuelType.isNotEmpty;
  }

  Future<void> _onSaveButtonPressed() async {
    if (_checkSaveButtonEnabled()) {
      VehicleData vehicleData = VehicleData(
        id: VehicleData.generateUniqueId(), // Generate unique ID
        imagePath: _image!.path, // Changed to imagePath
        vehicleNumber: _vehicleNumberController.text,
        vehicleMake: _vehicleMakeController.text,
        vehicleModel: _vehicleModelController.text,
        fuelType: _selectedFuelType,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> savedData = prefs.getStringList('savedData') ?? [];

      // Convert vehicle data to a map
      Map<String, dynamic> vehicleMap = vehicleData.toMap();

      // Convert map to JSON string
      String jsonData = jsonEncode(vehicleMap);

      // Save the JSON string to shared preferences
      savedData.add(jsonData);
      prefs.setStringList('savedData', savedData);

      // Clear fields for next entry
      _image = null;
      _vehicleNumberController.clear();
      _vehicleMakeController.clear();
      _vehicleModelController.clear();
      _selectedFuelType = 'Petrol';
      _isSaveButtonEnabled = false;

      setState(() {});
    }
  }

  void _goToVehicleDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VehicleDetails(previousPage: widget.previousPage)),
    );
  }
}
