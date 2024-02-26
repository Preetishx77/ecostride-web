import 'package:ecostrider/data/vehicleModel.dart';

Map<Type, String> selectionLists = {
  TwoWheelVehicleType: "2 Wheel",
  ThreeWheelVehicleType: "3 Wheel",
  FourWheelVehicleType: "4 Wheel",
  BigWheelVehicleType: "Big Wheel",
};

Map<dynamic, String> returnVehicleTypeData(Type vehicleWheelType) {
  switch (vehicleWheelType) {
    case TwoWheelVehicleType:
      return {
        TwoWheelVehicleType.Scooty: "Scooty",
        TwoWheelVehicleType.Bike: "Bike",
      };
    case ThreeWheelVehicleType:
      return {
        ThreeWheelVehicleType.AutoRickshaw: "Auto Rickshaw",
      };

    case FourWheelVehicleType:
      return {
        FourWheelVehicleType.Hatchback: "Hatchback",
        FourWheelVehicleType.Sedan: "Sedan",
        FourWheelVehicleType.SUV: "SUV",
        FourWheelVehicleType.PremiumHatchback: "Premium Hatchback",
        FourWheelVehicleType.PremiumSedan: "Premium Sedan",
        FourWheelVehicleType.PremiumSUV: "Premium SUV",
      };
    case BigWheelVehicleType:
      return {
        BigWheelVehicleType.LDV: "Light Duty Vehicle",
        BigWheelVehicleType.MDV: "Medium Duty Vehicle",
        BigWheelVehicleType.HDV: "Heavy Duty Vehicle",
      };

    default:
      return {
        TwoWheelVehicleType.Scooty: "Scooty",
        TwoWheelVehicleType.Bike: "Bike",
      };
  }
}

Map<FuelType, String> returnFuelTypeData(Type vehicleWheelType) {
  switch (vehicleWheelType) {
    case ThreeWheelVehicleType:
      return {
        FuelType.Petrol: "Petrol",
        FuelType.Diesel: "Diesel",
        FuelType.CNG: "CNG",
      };

    case FourWheelVehicleType:
      return {
        FuelType.Petrol: "Petrol",
        FuelType.Diesel: "Diesel",
      };
    case BigWheelVehicleType:
      return {
        FuelType.Petrol: "Petrol",
        FuelType.Diesel: "Diesel",
        FuelType.CNG: "CNG",
      };

    default:
      return {
        FuelType.Petrol: "Petrol",
        FuelType.Diesel: "Diesel",
        FuelType.CNG: "CNG",
      };
  }
}

// Data is procured from India Specific Road Transport Emission Factors - India GHG Program's official Report
Map<dynamic, dynamic> staticVehicleConsumptionData = {
  TwoWheelVehicleType: {
    TwoWheelVehicleType.Scooty: {110: 0.0368, 150: 0.0387},
    TwoWheelVehicleType.Bike: {100: 0.0358, 125: 0.0319, 135: 0.0356, 200: 0.0458, 300: 0.0595, 500: 0.0597}
  },
  ThreeWheelVehicle: {
    ThreeWheelVehicleType.AutoRickshaw: {FuelType.Petrol: 0.1135, FuelType.Diesel: 0.1322, FuelType.CNG: 0.10768},
  },
  FourWheelVehicle: {
    FourWheelVehicleType.Hatchback: {
      FuelType.Petrol: {
        1000: 0.127,
        1400: 0.140,
      },
      FuelType.Diesel: {1000: 0.113, 1400: 0.126, 1600: 0.147}
    },
    FourWheelVehicleType.PremiumHatchback: {
      FuelType.Petrol: {
        1600: 0.162,
      },
    },
    FourWheelVehicleType.Sedan: {
      FuelType.Petrol: {
        1400: 0.153,
        1600: 0.153,
        2000: 0.161,
        2500: 0.176,
      },
      FuelType.Diesel: {
        1400: 0.131,
        1600: 0.141,
        2000: 0.16,
      }
    },
    FourWheelVehicleType.PremiumSedan: {
      FuelType.Petrol: {
        2000: 0.207,
        3000: 0.209,
        3050: 0.290,
      },
      FuelType.Diesel: {
        2000: 0.177,
        2500: 0.163,
        3000: 0.248,
      }
    },
    FourWheelVehicleType.SUV: {
      FuelType.Petrol: {
        2000: 0.230,
        3000: 0.213,
      },
      FuelType.Diesel: {
        1400: 0.157,
        2000: 0.201,
        2500: 0.210,
        3000: 0.220,
      }
    },
    FourWheelVehicleType.PremiumSUV: {
      FuelType.Petrol: {
        2000: 0.208,
        3000: 0.279,
        3050: 0.289,
      },
      FuelType.Diesel: {
        2000: 0.180,
        2500: 0.215,
        3000: 0.240,
        3050: 0.290,
      }
    },
  },
  BigWheelVehicle: {
    BigWheelVehicleType.LDV: 0.3070,
    BigWheelVehicleType.MDV: 0.5928,
    BigWheelVehicleType.HDV: 0.7375,
  },
};
