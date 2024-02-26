// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/data/applianceModel.dart';
import 'package:ecostrider/data/electricityModel.dart';
import 'package:ecostrider/data/fuelModel.dart';
import 'package:ecostrider/data/vehicleModel.dart';
import 'package:ecostrider/helpers/helper.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CFResultDialog extends StatelessWidget {
  final String category;
  const CFResultDialog({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.4, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Wrap(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.black54, width: 0.6)),
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
                if (category == "Vehicle") VehicleCFResult(),
                if (category == "Fuel") FuelCFResult(),
                if (category == "Appliance") ApplianceCFResult(),
                if (category == "Electricity") ElectricityCFResult(),
                SizedBox(
                  height: 12,
                ),
                SecondaryButton(
                    isValid: true,
                    text: "Share",
                    height: 56,
                    borderColors: colorGreen1)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VehicleCFResult extends StatelessWidget {
  const VehicleCFResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedVehicle>(builder: (context, vehicle, ch) {
      return Column(
        children: [
          Text(
            getExpressionString(vehicle.calculatedCF),
            style: TextStyle(
                fontSize: 24,
                height: 32 / 24,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black87,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Your Total Carbon Footprints from Vehicle Drive is",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${vehicle.calculatedCF.toStringAsFixed(1)} Tonnes CO2 / y",
            style: TextStyle(
                fontSize: 32,
                height: 40 / 32,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            getExpressionMessage(vehicle.calculatedCF),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500),
          ),
        ],
      );
    });
  }
}

class FuelCFResult extends StatelessWidget {
  const FuelCFResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FuelModel>(builder: (context, fuel, ch) {
      return Column(
        children: [
          Text(
            getExpressionString(fuel.totalCF),
            style: TextStyle(
                fontSize: 24,
                height: 32 / 24,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black87,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Your Total Carbon Footprints from Fuel Consumption is",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${fuel.totalCF.toStringAsFixed(1)} Tonnes CO2 / y",
            style: TextStyle(
                fontSize: 32,
                height: 40 / 32,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            getExpressionMessage(fuel.totalCF),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500),
          ),
        ],
      );
    });
  }
}

class ApplianceCFResult extends StatelessWidget {
  const ApplianceCFResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplianceModel>(builder: (context, appliance, ch) {
      return Column(
        children: [
          Text(
            getExpressionString(appliance.totalCF),
            style: TextStyle(
                fontSize: 24,
                height: 32 / 24,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black87,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Your Total Carbon Footprints from Appliance usage is",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${appliance.totalCF.toStringAsFixed(1)} Tonnes CO2 / y",
            style: TextStyle(
                fontSize: 32,
                height: 40 / 32,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            getExpressionMessage(appliance.totalCF),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500),
          ),
        ],
      );
    });
  }
}

class ElectricityCFResult extends StatelessWidget {
  const ElectricityCFResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ElectricityModel>(builder: (context, electricity, ch) {
      return Column(
        children: [
          Text(
            getExpressionString(electricity.totalCF),
            style: TextStyle(
                fontSize: 24,
                height: 32 / 24,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black87,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Your Total Carbon Footprints from Electricity consumption is",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${electricity.totalCF.toStringAsFixed(1)} Tonnes CO2 / y",
            style: TextStyle(
                fontSize: 32,
                height: 40 / 32,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            getExpressionMessage(electricity.totalCF),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "PangeaAfrikanTrial",
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500),
          ),
        ],
      );
    });
  }
}
