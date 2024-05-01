import 'package:flutter/material.dart';
import 'dart:io';

import '../pages/vehicle_data.dart'; // Import VehicleData from vehicle_data.dart

class VehiViewPage extends StatefulWidget {
  final VehicleData vehicleData;
  final String previousPage;

  const VehiViewPage({required this.vehicleData, required this.previousPage});

  @override
  _VehiViewPageState createState() => _VehiViewPageState();
}

class _VehiViewPageState extends State<VehiViewPage> {
  String _status = 'available';

  void _handleButtonPress() {
    setState(() {
      _status = _status == 'available' ? 'taken' : 'available';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Vehicle'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.file(
                File(widget.vehicleData.imagePath),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text('${widget.vehicleData.vehicleNumber}'),
              SizedBox(height: 20),
              Text('${widget.vehicleData.vehicleMake}'),
              SizedBox(height: 20),
              Text('${widget.vehicleData.vehicleModel}'),
              SizedBox(height: 20),
              Text('${widget.vehicleData.fuelType}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleButtonPress();
                },
                child: Text(_status == 'available' ? 'Take' : 'Deliver'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
