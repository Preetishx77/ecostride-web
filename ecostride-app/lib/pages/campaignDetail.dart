// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'dart:async';

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/controllers/campaignController.dart';
import 'package:ecostrider/data/campaignModel.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CampaignDetailPage extends StatefulWidget {
  final CampaignController controller = CampaignController();
  final String id;
  CampaignDetailPage({super.key, required this.id});

  @override
  State<CampaignDetailPage> createState() => _CampaignDetailPageState();
}

class _CampaignDetailPageState extends State<CampaignDetailPage> {
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
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 0.4, color: Colors.black)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "images/image_cover.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<CampaignMap>(builder: (context, map, ch) {
                Campaign? campaign = map.campaigns[widget.id];
                return campaign == null
                    ? Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 30,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Oops ! Unable to find campaign",
                              style:
                                  TextStyle(fontSize: 24, height: 32 / 24, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            campaign.campaignName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 24, height: 32 / 24, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Organised by: ",
                            style: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                campaign.orgName,
                                style:
                                    TextStyle(fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Icon(
                                Icons.phone,
                                size: 20,
                                color: Colors.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Total Carbon Credits to be earned",
                            style: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${campaign.carbonCredits} Credits",
                            style: TextStyle(fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: colorGreen1, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Total fund raised",
                            style: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${campaign.amountCollected} / ${campaign.totalAmount}",
                            style: TextStyle(fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: colorGreen1, fontWeight: FontWeight.w600),
                          ),
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
                                  width: constraints.maxWidth * (campaign.amountCollected / campaign.totalAmount),
                                  decoration: BoxDecoration(color: colorGreen1, borderRadius: BorderRadius.circular(20)),
                                ),
                              ],
                            );
                          }),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Plants to be planted",
                            style: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          for (int i = 0; i < campaign.plantData.length; i++) ...{
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "🌴",
                                    style: TextStyle(
                                        fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      campaign.plantData[i]["name"],
                                      style: TextStyle(
                                          fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: "${campaign.plantData[i]["quantity"]}",
                                      style: TextStyle(
                                          fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: " @${campaign.plantData[i]["co2Sequestration"]} kgCO2",
                                      style: TextStyle(
                                          fontSize: 12,
                                          height: 16 / 12,
                                          fontFamily: "Poppins",
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ])),
                                ],
                              ),
                            )
                          },
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Total CO2 emission reduced (Lifetime)",
                            style: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "${campaign.co2sequestered * 10} kg",
                            style: TextStyle(fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Min. Contribution amount",
                            style: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "\u{20b9} 10",
                            style: TextStyle(fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Location of Campaign",
                            style: TextStyle(
                                fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: MapSample(
                                lat: double.parse(campaign.latitude),
                                long: double.parse(campaign.longitude),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 96,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: PrimaryButton(
          isValid: true,
          text: "Contribute Now",
          height: 52,
          backgroundColor: colorGreen2,
          onPressed: () async {
            widget.controller.showEnterAmountBottomSheet(context);
          },
        ),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  final double lat;
  final double long;
  const MapSample({super.key, required this.lat, required this.long});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late LatLng targetLoc;
  late CameraPosition initialLoc;

  @override
  void initState() {
    initialLoc = CameraPosition(
      target: LatLng(widget.lat, widget.long),
      zoom: 12,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialLoc,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
          markerId: MarkerId("Campaign"),
          position: LatLng(widget.lat, widget.long),
        ), // Marker
      },
    );
  }
}
