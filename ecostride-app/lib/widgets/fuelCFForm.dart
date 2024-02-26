// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/data/fuelModel.dart';
import 'package:ecostrider/helpers/fuelHelper.dart';
import 'package:ecostrider/widgets/calcResultDialog.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FuelCFForm extends StatefulWidget {
  const FuelCFForm({super.key});

  @override
  State<FuelCFForm> createState() => _FuelCFFormState();
}

class _FuelCFFormState extends State<FuelCFForm> {
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<FuelModel>(builder: (context, fuel, ch) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Type of Fuel 🪫",
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
              value: fuel.selectedFuel,
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
              items: fuelData.keys
                  .toList()
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(fuelData[e]["name"] ?? "",
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
                  FuelModel.instance.selectFuel(value, fuelData[value]);
                }
              },
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Amount Consumed in ${fuelData[fuel.selectedFuel]["unit"]} / month",
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
                    border:
                        Border.all(width: 0.4, color: Colors.grey.shade400)),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: amountController,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: "10",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          fontFamily: "Poppins",
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w400),
                      suffix: Text(
                        "${fuelData[fuel.selectedFuel]["unit"]}",
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
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          PrimaryButton(
            isValid:
                fuel.fuelMeta.isNotEmpty && amountController.text.isNotEmpty,
            height: 56,
            onPressed: () async {
              await fuel.calculateCarbonFootprint(
                  double.parse(amountController.text));

              // ignore: use_build_context_synchronously
              showDialog(
                  context: context,
                  builder: (context) => CFResultDialog(category: "Fuel"),
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
