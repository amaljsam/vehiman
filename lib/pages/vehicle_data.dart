import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // Import the uuid package

class VehicleData {
  final String id; // Unique ID for the vehicle
  final String imagePath;
  final String vehicleNumber;
  final String vehicleMake;
  final String vehicleModel;
  final String fuelType;

  VehicleData({
    required this.id,
    required this.imagePath,
    required this.vehicleNumber,
    required this.vehicleMake,
    required this.vehicleModel,
    required this.fuelType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'vehicleNumber': vehicleNumber,
      'vehicleMake': vehicleMake,
      'vehicleModel': vehicleModel,
      'fuelType': fuelType,
    };
  }

  static VehicleData fromMap(Map<String, dynamic> map) {
    return VehicleData(
      id: map['id'],
      imagePath: map['imagePath'],
      vehicleNumber: map['vehicleNumber'],
      vehicleMake: map['vehicleMake'],
      vehicleModel: map['vehicleModel'],
      fuelType: map['fuelType'],
    );
  }

  // Generate a unique ID using UUID
  static String generateUniqueId() {
    var uuid = Uuid();
    return uuid.v4();
  }
}
