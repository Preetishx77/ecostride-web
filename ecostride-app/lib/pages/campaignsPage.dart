// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/data/campaignModel.dart';
import 'package:ecostrider/pages/campaignDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CampaignsPage extends StatefulWidget {
  const CampaignsPage({super.key});

  @override
  State<CampaignsPage> createState() => _CampaignsPageState();
}

class _CampaignsPageState extends State<CampaignsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Contribute to ",
                style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "Sustainability\n",
                style: TextStyle(fontSize: 22, height: 30 / 22, fontFamily: "PangeaAfrikanTrial", color: colorGreen1, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: "and earn ",
                style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "Offsets",
                style: TextStyle(fontSize: 22, height: 30 / 22, fontFamily: "PangeaAfrikanTrial", color: colorGreen1, fontWeight: FontWeight.w700),
              ),
            ])),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: Consumer<CampaignMap>(builder: (context, map, ch) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                for (int i = 0; i < map.campaigns.length; i++) ...{
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CampaignDetailPage(
                                    id: map.campaigns.keys.toList()[i],
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12), border: Border.all(width: 0.6, color: Colors.grey.shade300), color: Colors.white),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            child: Image.asset(
                              "images/image_cover.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  map.campaigns.values.toList()[i].campaignName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20, height: 28 / 20, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Organised by - ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 20 / 14,
                                        fontFamily: "Poppins",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: map.campaigns.values.toList()[i].orgName,
                                    style: TextStyle(
                                        fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                ])),
                                SizedBox(
                                  height: 8,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Carbon Credits to be earned: ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 20 / 14,
                                        fontFamily: "Poppins",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: "${map.campaigns.values.toList()[i].carbonCredits}",
                                    style: TextStyle(
                                        fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                ])),
                                SizedBox(
                                  height: 8,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Amount Raised: ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        height: 20 / 14,
                                        fontFamily: "Poppins",
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: "${map.campaigns.values.toList()[i].amountCollected} / ${map.campaigns.values.toList()[i].totalAmount} INR",
                                    style: TextStyle(
                                        fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                ])),
                                SizedBox(
                                  height: 10,
                                ),
                                LayoutBuilder(builder: (context, constraints) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: constraints.maxWidth,
                                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 800),
                                        curve: Curves.decelerate,
                                        height: 5,
                                        width: constraints.maxWidth *
                                            (map.campaigns.values.toList()[i].amountCollected / map.campaigns.values.toList()[i].totalAmount),
                                        decoration: BoxDecoration(color: colorGreen1, borderRadius: BorderRadius.circular(20)),
                                      )
                                    ],
                                  );
                                }),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: colorGreen2),
                                      child: Text(
                                        "Contribute Now",
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14, height: 20 / 14, fontFamily: "Poppins"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                },
              ],
            );
          }))
        ],
      ),
    ));
  }
}
