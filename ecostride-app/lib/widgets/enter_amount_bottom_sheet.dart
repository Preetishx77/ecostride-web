// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/controllers/campaignController.dart';
import 'package:ecostrider/widgets/payment_success_bottom_sheet.dart';

import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddAmountBottomSheet extends StatefulWidget {
  const AddAmountBottomSheet({super.key});

  @override
  State<AddAmountBottomSheet> createState() => _AddAmountBottomSheetState();
}

class _AddAmountBottomSheetState extends State<AddAmountBottomSheet> {
  TextEditingController amountController = TextEditingController();
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
                        "Sustain the Sustainable 💰",
                        style: TextStyle(
                            fontSize: 24, fontFamily: "PangeaAfrikanTrial", height: 32 / 24, color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        "We closely work with our payment partners to ensure full accredition of your data security.",
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
                    Text("Contribution Amount 💵",
                        style: TextStyle(
                            fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(width: 0.4, color: Colors.grey.shade400)),
                      child: TextField(
                        controller: amountController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "3",
                            hintStyle: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade500, fontWeight: FontWeight.w400),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            border: InputBorder.none,
                            errorBorder: InputBorder.none),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SecondaryButton(
                        isValid: amountController.text.isNotEmpty && double.parse(amountController.text.isEmpty ? "0.0" : amountController.text) > 10,
                        text: "Proceed",
                        onPressed: () async {
                          await CampaignController().createPayment(double.parse(amountController.text), context);
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
