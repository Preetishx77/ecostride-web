import 'package:flutter/material.dart';

class ElectricityModel with ChangeNotifier {
  double totalCF = 0.0;

  ElectricityModel._privateConstructor();

  static final ElectricityModel instance =
      ElectricityModel._privateConstructor();

  Map<String, dynamic> electricityData = {
    "Country": "India",
    "CO2": 1.800805423,
    "CH4": 0.000020968,
  };

  Future<void> calculateCarbonFootprint(double totalUnits) async {
    await Future.delayed(const Duration(seconds: 3));
    totalCF =
        ((electricityData["CO2"] + electricityData["CH4"]) * totalUnits * 12) /
            1000;
    notifyListeners();
  }
}
