// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names
import 'package:ecostrider/constants.dart';
import 'package:ecostrider/data/electricityModel.dart';
import 'package:ecostrider/widgets/calcResultDialog.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ElectricityCFForm extends StatefulWidget {
  const ElectricityCFForm({super.key});

  @override
  State<ElectricityCFForm> createState() => _ElectricityCFFormState();
}

class _ElectricityCFFormState extends State<ElectricityCFForm> {
  TextEditingController unitsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ElectricityModel>(builder: (context, electricity, ch) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Units of electricity consumed / month 🔋",
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
              controller: unitsController,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: "132.6",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      height: 24 / 16,
                      fontFamily: "Poppins",
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400),
                  suffix: Text(
                    "units",
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
            height: 20,
          ),
          PrimaryButton(
            isValid: unitsController.text.isNotEmpty,
            height: 56,
            onPressed: () async {
              await electricity
                  .calculateCarbonFootprint(double.parse(unitsController.text));
              // ignore: use_build_context_synchronously
              showDialog(
                  context: context,
                  builder: (context) => CFResultDialog(category: "Electricity"),
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
