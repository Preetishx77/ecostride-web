import 'package:ecostrider/data/vehicleModel.dart';

Map<FuelType, dynamic> fuelData = {
  FuelType.Petrol: {"name": "Petrol", "emissionFactor": 2.3367953, "unit": "L"},
  FuelType.Diesel: {
    "name": "Diesel",
    "emissionFactor": 2.62307049,
    "unit": "L"
  },
  FuelType.BioDiesel: {
    "name": "Bio Diesel",
    "emissionFactor": 2.48771122,
    "unit": "L"
  },
  FuelType.Ethanol: {
    "name": "Ethanol",
    "emissionFactor": 1.50438097,
    "unit": "L"
  },
  FuelType.E10: {
    "name": "Petrol (10% Ethanol)",
    "emissionFactor": 2.2535525,
    "unit": "L"
  },
  FuelType.E25: {
    "name": "Petrol (25% Ethanol)",
    "emissionFactor": 2.12869302,
    "unit": "L"
  },
  FuelType.E85: {
    "name": "Petrol (85% Ethanol)",
    "emissionFactor": 1.62924343,
    "unit": "L"
  },
  FuelType.B20: {
    "name": "Diesel (20% Bio Diesel)",
    "emissionFactor": 2.59599849,
    "unit": "L"
  },
  FuelType.CNG: {"name": "CNG", "emissionFactor": 1.72676529, "unit": "Kg"},
  FuelType.LPG: {"name": "LPG", "emissionFactor": 1.5395559, "unit": "Kg"},
};
