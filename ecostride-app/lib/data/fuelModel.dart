import 'package:ecostrider/data/vehicleModel.dart';
import 'package:flutter/material.dart';

class FuelModel with ChangeNotifier {
  FuelType selectedFuel = FuelType.Petrol;
  Map<String, dynamic> fuelMeta = {};
  double totalCF = 0.0;

  FuelModel._privateConstructor();

  static final FuelModel instance = FuelModel._privateConstructor();

  void selectFuel(FuelType selectFuel, Map<String, dynamic> selectFuelMeta) {
    selectedFuel = selectFuel;
    fuelMeta = selectFuelMeta;
    notifyListeners();
  }

  Future<void> calculateCarbonFootprint(double amountConsumed) async {
    await Future.delayed(const Duration(seconds: 3));
    totalCF = (fuelMeta["emissionFactor"] * amountConsumed * 12) / 1000;

    notifyListeners();
  }
}
