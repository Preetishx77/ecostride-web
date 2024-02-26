// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessBottomSheet extends StatefulWidget {
  const PaymentSuccessBottomSheet({super.key});

  @override
  State<PaymentSuccessBottomSheet> createState() => _PaymentSuccessBottomSheetState();
}

class _PaymentSuccessBottomSheetState extends State<PaymentSuccessBottomSheet> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            decoration: BoxDecoration(color: Colors.white),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
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
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Lottie.asset(isLoading ? "images/pending_animation.json" : "images/success_animation.json", height: 100, width: 100),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        isLoading ? "Payment in Progress" : "Contribution Successful 🥳",
                        style: TextStyle(
                            fontSize: 24, fontFamily: "PangeaAfrikanTrial", height: 32 / 24, color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    if (!isLoading)
                      Center(
                        child: Text(
                          "We can't thank you enough for providing your precious contribution to one of our partner programs. Although we understand that rewards are amazing, but the process takes time.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "PangeaAfrikanTrial",
                              height: 22 / 16,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    if (!isLoading)
                      SizedBox(
                        height: 12,
                      ),
                    if (!isLoading)
                      Center(
                        child: Text(
                          "Once the campaign is completed and verified by the issuance partner, your reward will be successfully credited. Until then Share your joy of a step towards sustainability",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontFamily: "PangeaAfrikanTrial", height: 22 / 16, color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                    if (!isLoading)
                      SizedBox(
                        height: 32,
                      ),
                    if (!isLoading)
                      SecondaryButton(
                        isValid: true,
                        text: "Go Back",
                        height: 52,
                        borderColors: colorGreen2,
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      )
                  ]))
            ]))
      ],
    );
  }
}
