import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/vehicle_data.dart';

class VehiEditPage extends StatefulWidget {
  final VehicleData vehicleData;
  final UniqueKey uniqueKey;
  final String previousPage;

  VehiEditPage({required this.vehicleData, required this.uniqueKey, required this.previousPage});

  @override
  _VehiEditPageState createState() => _VehiEditPageState();
}

class _VehiEditPageState extends State<VehiEditPage> {
  late TextEditingController _vehicleNumberController;
  late TextEditingController _vehicleMakeController;
  late TextEditingController _vehicleModelController;
  late String _fuelType;
  late String _imagePath;

  final List<String> fuelTypes = ['Petrol', 'Diesel'];

  @override
  void initState() {
    super.initState();
    _vehicleNumberController =
        TextEditingController(text: widget.vehicleData.vehicleNumber);
    _vehicleMakeController =
        TextEditingController(text: widget.vehicleData.vehicleMake);
    _vehicleModelController =
        TextEditingController(text: widget.vehicleData.vehicleModel);
    _fuelType = widget.vehicleData.fuelType;
    _imagePath = widget.vehicleData.imagePath;
  }

  @override
  void dispose() {
    _vehicleNumberController.dispose();
    _vehicleMakeController.dispose();
    _vehicleModelController.dispose();
    super.dispose();
  }

  void _saveChanges() async {
    VehicleData updatedVehicleData = VehicleData(
      id: widget.vehicleData.id,
      vehicleNumber: _vehicleNumberController.text,
      vehicleMake: _vehicleMakeController.text,
      vehicleModel: _vehicleModelController.text,
      fuelType: _fuelType,
      imagePath: _imagePath,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedData = prefs.getStringList('savedData') ?? [];
    int index = savedData.indexWhere((data) => jsonDecode(data)['id'] == widget.vehicleData.id);
    if (index != -1) {
      savedData[index] = jsonEncode(updatedVehicleData.toMap());
    } else {
      savedData.add(jsonEncode(updatedVehicleData.toMap()));
    }
    await prefs.setStringList('savedData', savedData);

    Navigator.pop(context, updatedVehicleData);
  }

  void _deleteVehicle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedData = prefs.getStringList('savedData') ?? [];
    savedData.removeWhere((data) => jsonDecode(data)['id'] == widget.vehicleData.id);
    await prefs.setStringList('savedData', savedData);

    Navigator.pop(context, null); // Pop without passing any data to indicate deletion.
  }

  void _changeImage(String newImagePath) {
    setState(() {
      _imagePath = newImagePath;
    });
  }

  void _onImageChange() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Add from gallery'),
              onTap: () {
                _getImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a pic'),
              onTap: () {
                _getImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      _changeImage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Vehicle'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.file(
                    File(_imagePath),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _onImageChange,
                    child: Text('Change Image'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _vehicleNumberController,
              decoration: InputDecoration(labelText: 'Vehicle Number'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _vehicleMakeController,
              decoration: InputDecoration(labelText: 'Vehicle Make'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _vehicleModelController,
              decoration: InputDecoration(labelText: 'Vehicle Model'),
            ),
            SizedBox(height: 20),
            Text('Fuel Type:'),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _fuelType,
              onChanged: (String? newValue) {
                setState(() {
                  _fuelType = newValue!;
                });
              },
              items: fuelTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _deleteVehicle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Change button color to red for deletion
                ),
                child: Text('Delete'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
