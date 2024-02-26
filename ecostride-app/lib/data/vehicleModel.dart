// ignore_for_file: constant_identifier_names

import 'package:ecostrider/helpers/vehicleHelper.dart';
import 'package:flutter/material.dart';

enum TwoWheelVehicleType { Scooty, Bike }

enum ThreeWheelVehicleType { AutoRickshaw }

enum FourWheelVehicleType {
  Hatchback,
  PremiumHatchback,
  Sedan,
  PremiumSedan,
  SUV,
  PremiumSUV
}

enum BigWheelVehicleType { LDV, MDV, HDV }

enum FuelType {
  Petrol,
  Diesel,
  CNG,
  LPG,
  E10,
  E25,
  E85,
  BioDiesel,
  B20,
  Ethanol
}

class Vehicle {
  final FuelType fuelType;
  final int? engineCC;
  final double kmsTravelled;

  Vehicle({required this.fuelType, this.engineCC, required this.kmsTravelled});

  double calculateCF() {
    return 0.0;
  }
}

class TwoWheelVehicle extends Vehicle {
  final TwoWheelVehicleType vehicleType;
  TwoWheelVehicle(
      {required super.fuelType,
      required super.engineCC,
      required super.kmsTravelled,
      required this.vehicleType});

  @override
  double calculateCF() {
    Map<dynamic, dynamic> resp =
        staticVehicleConsumptionData[TwoWheelVehicleType][vehicleType];
    num emissionFactorResp = resp.keys.firstWhere(
      (element) => engineCC! <= element,
      orElse: () => 0,
    );
    if (emissionFactorResp == 0.0) {
      return 0;
    } else {
      num emissionFactor = resp[emissionFactorResp] ?? 0;
      return (emissionFactor * kmsTravelled * 12) / 1000;
    }
  }
}

class ThreeWheelVehicle extends Vehicle {
  final ThreeWheelVehicleType vehicleType;
  ThreeWheelVehicle(
      {required super.fuelType,
      required super.kmsTravelled,
      required this.vehicleType});

  @override
  double calculateCF() {
    Map<dynamic, dynamic> resp =
        staticVehicleConsumptionData[ThreeWheelVehicle][vehicleType];
    double emissionFactor = resp.containsKey(fuelType) ? resp[fuelType] : 0.0;
    if (emissionFactor == 0.0) {
      return 0;
    } else {
      return (emissionFactor * kmsTravelled * 12) / 1000;
    }
  }
}

class FourWheelVehicle extends Vehicle {
  final FourWheelVehicleType vehicleType;
  FourWheelVehicle(
      {required super.fuelType,
      required super.engineCC,
      required super.kmsTravelled,
      required this.vehicleType});

  @override
  double calculateCF() {
    Map<dynamic, dynamic> resp =
        staticVehicleConsumptionData[FourWheelVehicle][vehicleType];
    if (resp.containsKey(fuelType)) {
      num emissionFactorResp = resp[fuelType].keys.firstWhere(
            (element) => engineCC! <= element,
            orElse: () => 0,
          );

      if (emissionFactorResp == 0) {
        return 0;
      } else {
        num emissionFactor = resp[fuelType][emissionFactorResp];
        return (emissionFactor * kmsTravelled * 12) / 1000;
      }
    }
    return 0;
  }
}

class BigWheelVehicle extends Vehicle {
  final BigWheelVehicleType vehicleType;
  BigWheelVehicle(
      {required super.fuelType,
      required super.kmsTravelled,
      required this.vehicleType});

  @override
  double calculateCF() {
    double emissionFactor =
        staticVehicleConsumptionData[BigWheelVehicle][vehicleType];
    if (emissionFactor == 0) {
      return 0;
    } else {
      return (emissionFactor * kmsTravelled * 12) / 1000;
    }
  }
}

class SelectedVehicle with ChangeNotifier {
  Type vehicleWheelType = TwoWheelVehicleType;
  dynamic vehicleType;
  int? engineCC;
  double? kmsTravelled;
  FuelType fuelType = FuelType.Petrol;

  double calculatedCF = 0.0;

  SelectedVehicle._privateConstructor();

  static final SelectedVehicle instance = SelectedVehicle._privateConstructor();

  changeVehicleWheelType(Type newVehicleType) {
    vehicleWheelType = newVehicleType;
    notifyListeners();
  }

  changeVehicleType(dynamic newVehicle) {
    vehicleType = newVehicle;
    notifyListeners();
  }

  changeEngineCC(int engineCC) {
    this.engineCC = engineCC;
    notifyListeners();
  }

  changeKmsTravelled(double kmsTravelled) {
    this.kmsTravelled = kmsTravelled;
    notifyListeners();
  }

  changeFuelType(FuelType fuelType) {
    this.fuelType = fuelType;
    notifyListeners();
  }

  Future<void> calculateCarbonFootprint() async {
    await Future.delayed(const Duration(seconds: 3));
    switch (vehicleWheelType) {
      case TwoWheelVehicleType:
        TwoWheelVehicle newVehicle = TwoWheelVehicle(
            fuelType: fuelType,
            engineCC: engineCC,
            kmsTravelled: kmsTravelled ?? 0.0,
            vehicleType: vehicleType);
        calculatedCF = newVehicle.calculateCF().toDouble();
        break;
      case ThreeWheelVehicleType:
        ThreeWheelVehicle newVehicle = ThreeWheelVehicle(
            fuelType: fuelType,
            kmsTravelled: kmsTravelled ?? 0.0,
            vehicleType: vehicleType);
        calculatedCF = newVehicle.calculateCF().toDouble();
        break;
      case FourWheelVehicleType:
        FourWheelVehicle newVehicle = FourWheelVehicle(
            fuelType: fuelType,
            engineCC: engineCC,
            kmsTravelled: kmsTravelled ?? 0.0,
            vehicleType: vehicleType);
        calculatedCF = newVehicle.calculateCF().toDouble();
        break;
      case BigWheelVehicleType:
        BigWheelVehicle newVehicle = BigWheelVehicle(
            fuelType: fuelType,
            kmsTravelled: kmsTravelled ?? 0.0,
            vehicleType: vehicleType);
        calculatedCF = newVehicle.calculateCF().toDouble();
        break;
      default:
    }
    notifyListeners();
  }
}
