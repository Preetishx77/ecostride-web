// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names
import 'package:ecostrider/constants.dart';
import 'package:ecostrider/pages/calculatorPage.dart';
import 'package:ecostrider/pages/ecobotPage.dart';
import 'package:flutter/material.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Interested in\n",
                style: TextStyle(fontSize: 26, height: 34 / 26, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "Carbon Footprint?",
                style: TextStyle(fontSize: 30, height: 38 / 30, fontFamily: "PangeaAfrikanTrial", color: colorGreen1, fontWeight: FontWeight.w600),
              ),
            ])),
            SizedBox(
              height: 12,
            ),
            Text("Use our tools to know more about the powerful sustainability element.",
                style: TextStyle(fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 26,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Calculatorpage()));
              },
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 0.4, color: Colors.grey.shade400),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "images/calculator.png",
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text("Carbon Footprint Calculator",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade900, fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 24,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EcobotPage()));
              },
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 0.4, color: Colors.grey.shade400),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "images/chatbot.png",
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Ecobot by ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade900, fontWeight: FontWeight.w400)),
                          Image.asset(
                            "images/gemini_logo.png",
                            width: 42,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 24,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
