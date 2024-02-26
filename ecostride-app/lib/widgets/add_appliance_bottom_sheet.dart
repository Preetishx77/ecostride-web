// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/data/applianceModel.dart';
import 'package:ecostrider/helpers/applianceHelper.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddApplianceBottomSheet extends StatefulWidget {
  const AddApplianceBottomSheet({super.key});

  @override
  State<AddApplianceBottomSheet> createState() =>
      _AddApplianceBottomSheetState();
}

class _AddApplianceBottomSheetState extends State<AddApplianceBottomSheet> {
  Map<String, dynamic> selectedAppliance = appliances[0];
  TextEditingController hoursController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: List.generate(
                    borderColors.length,
                    (index) => Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width / 4,
                          color: borderColors[index],
                        )),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Add New Appliance 🖥️",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "PangeaAfrikanTrial",
                            height: 32 / 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        "Please ensure the input of authentic data for accurate calculations",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "PangeaAfrikanTrial",
                            height: 22 / 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(width: 0.4, color: Colors.black54)),
                      child: DropdownButton(
                        value: selectedAppliance,
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
                        items: appliances
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Text(e["applianceName"] ?? "",
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
                            setState(() {
                              selectedAppliance = value;
                            });
                            // ApplianceModel.instance
                            //     .addToSelectedModels(selectedAppliance);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Approx. energy consumed / hour",
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              height: 20 / 14,
                              fontFamily: "Poppins",
                              color: Colors.black45,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${selectedAppliance["powerConsumed"]} Wh",
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              height: 20 / 14,
                              fontFamily: "Poppins",
                              color: Colors.black45,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Time operated per month ⏰",
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 0.4, color: Colors.grey.shade400)),
                      child: TextField(
                        controller: hoursController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "3",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                height: 24 / 16,
                                fontFamily: "Poppins",
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w400),
                            suffix: Text(
                              "hrs",
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
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SecondaryButton(
                        isValid: hoursController.text.isNotEmpty,
                        text: "Add Appliance",
                        onPressed: () async {
                          ApplianceModel.instance.addToSelectedModels(
                              selectedAppliance,
                              double.parse(hoursController.text));
                          Navigator.pop(context);
                        },
                        height: 56,
                        borderColors: colorGreen2)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
