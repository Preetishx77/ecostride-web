// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names
import 'package:ecostrider/constants.dart';
import 'package:ecostrider/data/applianceModel.dart';
import 'package:ecostrider/widgets/add_appliance_bottom_sheet.dart';
import 'package:ecostrider/widgets/calcResultDialog.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplianceCFForm extends StatelessWidget {
  const ApplianceCFForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplianceModel>(builder: (context, appliance, ch) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  "Selected Appliances 💻",
                  style: TextStyle(
                      fontSize: 12,
                      height: 16 / 12,
                      fontFamily: "Poppins",
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Text(
                "Hours operated 🕣",
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 12,
                    height: 16 / 12,
                    fontFamily: "Poppins",
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          if (appliance.selectedModels.isEmpty)
            Center(
              child: Text("Please add atleast one appliance 🙏🏻",
                  style: TextStyle(
                      fontSize: 14,
                      height: 20 / 14,
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
            ),
          for (int i = 0; i < appliance.selectedModels.length; i++) ...{
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onDoubleTap: () {
                  appliance.removeFromSelectedModel(
                      appliance.selectedModels.keys.toList()[i]);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        appliance.selectedModels.keys.toList()[i],
                        style: TextStyle(
                            fontSize: 16,
                            height: 24 / 16,
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Text(
                      "${appliance.selectedModels.values.toList()[i].toInt()} hrs",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 14,
                          height: 20 / 14,
                          fontFamily: "Poppins",
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ))
                  ],
                ),
              ),
            )
          },
          SizedBox(
            height: 20,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => AddApplianceBottomSheet());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.4, color: colorGreen2),
                  borderRadius: BorderRadius.circular(8)),
              child: Text("+ Add Appliance",
                  style: TextStyle(
                      fontSize: 14,
                      height: 20 / 14,
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(
            isValid: appliance.selectedModels.isNotEmpty,
            height: 56,
            onPressed: () async {
              await appliance.calculateCarbonFootprint();
              // ignore: use_build_context_synchronously
              showDialog(
                  context: context,
                  builder: (context) => CFResultDialog(category: "Appliance"),
                  barrierDismissible: false);
            },
            text: 'How many Footprints ?',
            backgroundColor: colorGreen2,
          )
        ],
      );
    });
  }
}
