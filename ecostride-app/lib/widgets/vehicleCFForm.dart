// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/data/vehicleModel.dart';
import 'package:ecostrider/helpers/vehicleHelper.dart';
import 'package:ecostrider/widgets/calcResultDialog.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class VehicleCFForm extends StatelessWidget {
  const VehicleCFForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedVehicle>(builder: (context, vehicle, ch) {
      bool isValid = ((vehicle.vehicleWheelType == FourWheelVehicleType ||
                  vehicle.vehicleWheelType == TwoWheelVehicleType)
              ? vehicle.engineCC != null
              : true) &&
          vehicle.kmsTravelled != null &&
          vehicle.vehicleType != null;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("No. of Wheels 🛞",
              style: TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  fontFamily: "Poppins",
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.4, color: Colors.grey.shade400)),
            child: DropdownButton(
              value: vehicle.vehicleWheelType,
              alignment: AlignmentDirectional.bottomEnd,
              isExpanded: true,
              isDense: true,
              borderRadius: BorderRadius.circular(8),
              elevation: 2,
              icon: Material(
                color: Colors.white,
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black,
                    )),
              ),
              dropdownColor: Colors.white,
              underline: SizedBox(),
              items: selectionLists.keys
                  .toList()
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(selectionLists[e] ?? "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: 24 / 16,
                                      fontFamily: "Poppins",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  vehicle.changeVehicleType(null);
                  vehicle.changeVehicleWheelType(value);
                }
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text("Category 🚘",
              style: TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  fontFamily: "Poppins",
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.4, color: Colors.grey.shade400)),
            child: DropdownButton(
              value: vehicle.vehicleType,
              isExpanded: true,
              isDense: true,
              borderRadius: BorderRadius.circular(8),
              elevation: 2,
              icon: Material(
                color: Colors.white,
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black,
                    )),
              ),
              dropdownColor: Colors.white,
              underline: SizedBox(),
              items: returnVehicleTypeData(vehicle.vehicleWheelType)
                  .keys
                  .toList()
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(
                                  returnVehicleTypeData(
                                          vehicle.vehicleWheelType)[e] ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: 24 / 16,
                                      fontFamily: "Poppins",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  vehicle.changeVehicleType(value);
                }
              },
            ),
          ),
          if (vehicle.vehicleWheelType != TwoWheelVehicleType)
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fuel Type ⛽️",
                      style: TextStyle(
                          fontSize: 14,
                          height: 20 / 14,
                          fontFamily: "Poppins",
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.4, color: Colors.grey.shade400)),
                    child: DropdownButton(
                      value: vehicle.fuelType,
                      isExpanded: true,
                      isDense: true,
                      borderRadius: BorderRadius.circular(8),
                      elevation: 2,
                      icon: Material(
                        color: Colors.white,
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.chevron_left_rounded,
                              color: Colors.black,
                            )),
                      ),
                      dropdownColor: Colors.white,
                      underline: SizedBox(),
                      items: returnFuelTypeData(vehicle.vehicleWheelType)
                          .keys
                          .toList()
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Text(
                                          returnFuelTypeData(vehicle
                                                  .vehicleWheelType)[e] ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 16,
                                              height: 24 / 16,
                                              fontFamily: "Poppins",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          vehicle.changeFuelType(value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          if (vehicle.vehicleWheelType == TwoWheelVehicleType ||
              vehicle.vehicleWheelType == FourWheelVehicleType)
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Engine Size (in cc) ⚙️",
                      style: TextStyle(
                          fontSize: 14,
                          height: 20 / 14,
                          fontFamily: "Poppins",
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.4, color: Colors.grey.shade400)),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: "125",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              height: 24 / 16,
                              fontFamily: "Poppins",
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w400),
                          suffix: Text(
                            "cc",
                            style: TextStyle(
                                fontSize: 16,
                                height: 24 / 16,
                                fontFamily: "Poppins",
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w400),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorBorder: InputBorder.none),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          vehicle.changeEngineCC(int.parse(value));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 24,
          ),
          Text("Avg. kms travelled per month 🏁",
              style: TextStyle(
                  fontSize: 14,
                  height: 20 / 14,
                  fontFamily: "Poppins",
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.4, color: Colors.grey.shade400)),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: "200",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      height: 24 / 16,
                      fontFamily: "Poppins",
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400),
                  suffix: Text(
                    "kms",
                    style: TextStyle(
                        fontSize: 16,
                        height: 24 / 16,
                        fontFamily: "Poppins",
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  vehicle.changeKmsTravelled(double.parse(value));
                }
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          PrimaryButton(
            isValid: isValid,
            height: 56,
            onPressed: () async {
              await vehicle.calculateCarbonFootprint();
              // ignore: use_build_context_synchronously
              showDialog(
                  context: context,
                  builder: (context) => CFResultDialog(category: "Vehicle"),
                  barrierDismissible: false);
            },
            text: 'How much Credits ?',
            backgroundColor: colorGreen2,
          )
        ],
      );
    });
  }
}
