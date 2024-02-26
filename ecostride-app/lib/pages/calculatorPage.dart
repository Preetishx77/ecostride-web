// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names
import 'package:ecostrider/constants.dart';
import 'package:ecostrider/helpers/helper.dart';
import 'package:ecostrider/widgets/applianceCFForm.dart';
import 'package:ecostrider/widgets/electricityCFForm.dart';
import 'package:ecostrider/widgets/fuelCFForm.dart';
import 'package:ecostrider/widgets/vehicleCFForm.dart';
import 'package:flutter/material.dart';

class Calculatorpage extends StatelessWidget {
  Calculatorpage({super.key});

  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
        leading: Container(
          width: 24,
          height: 24,
          margin: EdgeInsets.fromLTRB(16, 0, 0, 10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 0.4, color: Colors.black)),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Worried about your\n",
                style: TextStyle(
                    fontSize: 24,
                    height: 32 / 24,
                    fontFamily: "PangeaAfrikanTrial",
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: "Carbon Footprint?",
                style: TextStyle(
                    fontSize: 32,
                    height: 40 / 32,
                    fontFamily: "PangeaAfrikanTrial",
                    color: colorGreen1,
                    fontWeight: FontWeight.w700),
              ),
            ])),
            SizedBox(
              height: 12,
            ),
            Text(
              "Chill ! We've got you covered.",
              style: TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  fontFamily: "Poppins",
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500),
            ),
            // SizedBox(
            //   height: 16,
            // ),
            // Center(
            //   child: Text(
            //     "Our offerings are currently limited to Indian subcontinent only.",
            //     style: TextStyle(
            //         fontSize: 12,
            //         height: 16 / 12,
            //         fontFamily: "Poppins",
            //         color: Colors.black54,
            //         fontWeight: FontWeight.w400),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: selectedIndex,
                  builder: (context, index, ch) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("For what do you want to check for?",
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 0.4, color: Colors.grey.shade400)),
                            child: DropdownButton(
                              value: availableCalcValues[index],
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
                              items: availableCalcValues
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Container(
                                          color: Colors.white,
                                          child: Row(
                                            children: [
                                              Text(e,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      height: 24 / 16,
                                                      fontFamily: "Poppins",
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  selectedIndex.value =
                                      availableCalcValues.indexOf(value);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          if (index == 0) VehicleCFForm(),
                          if (index == 1) ApplianceCFForm(),
                          if (index == 2) ElectricityCFForm(),
                          if (index == 3) FuelCFForm(),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
