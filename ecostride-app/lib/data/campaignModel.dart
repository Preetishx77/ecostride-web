import 'package:flutter/material.dart';

class Campaign {
  String id = "";
  String campaignName = "";
  String orgName = "";
  String latitude = "";
  String longitude = "";
  num co2sequestered = 0.0;
  num amountCollected = 0.0;
  num totalAmount = 0.0;
  num carbonCredits = 0.0;
  List<dynamic> plantData = [];

  Campaign._privateConstructor();

  static final Campaign instance = Campaign._privateConstructor();

  Campaign.fromJson(dynamic data) {
    id = data["campaignId"] ?? "";
    campaignName = data["campaignName"] ?? "";
    orgName = data["orgName"] ?? "";
    latitude = data["latitude"] ?? "";
    longitude = data["longitude"] ?? "";
    co2sequestered = data["Totalco2Sequestration"] ?? 0.0;
    amountCollected = data["collectedAmount"] ?? 0.0;
    totalAmount = data["targetAmount"] ?? 0.0;
    carbonCredits = data["CarbonCredits"] ?? 0.0;
    plantData = data["plantdata"] as List<dynamic>;
  }
}

class CampaignMap with ChangeNotifier {
  List<dynamic> campaignIds = [];
  Map<String, Campaign> campaigns = {};

  CampaignMap._privateConstructor();

  static final CampaignMap instance = CampaignMap._privateConstructor();

  void setCampaignList(List<dynamic> campaigns) {
    campaignIds = campaigns;
    notifyListeners();
  }

  void addToMap(Map<String, dynamic> campaign) {
    campaigns[campaign["campaignId"]] = Campaign.fromJson(campaign);
    notifyListeners();
  }
}
