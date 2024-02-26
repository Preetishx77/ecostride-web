// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ApplianceModel with ChangeNotifier {
  Map<String, double> selectedModels = {};
  double totalConsumption = 0.0;
  double totalCF = 0.0;

  ApplianceModel._privateConstructor();

  static final ApplianceModel instance = ApplianceModel._privateConstructor();

  addToSelectedModels(Map<String, dynamic> appliance, double timeConsumed) {
    if (selectedModels.isEmpty) {
      selectedModels[appliance["applianceName"]] = timeConsumed;
      totalConsumption = timeConsumed *
          (double.parse(appliance["powerConsumed"].toString()) / 1000);
    } else {
      if (!selectedModels.containsKey(appliance["applianceName"])) {
        selectedModels[appliance["applianceName"]] = timeConsumed;
        totalConsumption += timeConsumed *
            (double.parse(appliance["powerConsumed"].toString()) / 1000);
      }
    }
    notifyListeners();
  }

  removeFromSelectedModel(String applianceId) {
    selectedModels.removeWhere((key, value) => key == applianceId);
    notifyListeners();
  }

  clearModel() {
    selectedModels.clear();
    totalConsumption = 0.0;
    notifyListeners();
  }

  Future<void> calculateCarbonFootprint() async {
    await Future.delayed(const Duration(seconds: 3));
    totalCF = (0.715 * totalConsumption * 12) / 1000;
    notifyListeners();
  }
}
