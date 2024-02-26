// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names
import 'package:any_link_preview/any_link_preview.dart';
import 'package:ecostrider/constants.dart';
import 'package:ecostrider/controllers/campaignController.dart';
import 'package:ecostrider/data/campaignModel.dart';
import 'package:ecostrider/helpers/helper.dart';
import 'package:ecostrider/pages/campaignDetail.dart';
import 'package:ecostrider/pages/ecobotPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Hi there,\n",
                style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "How are you doing?",
                style: TextStyle(fontSize: 22, height: 30 / 22, fontFamily: "PangeaAfrikanTrial", color: colorGreen1, fontWeight: FontWeight.w500),
              ),
            ])),
          ),
          SizedBox(
            height: 16,
          ),
          WalletCard(),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Top Campaigns !",
              style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Consumer<CampaignMap>(builder: (context, campaign, ch) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 150,
                  child: Row(
                    children: List.generate(
                        campaign.campaignIds.length < 3 ? campaign.campaignIds.length : 3,
                        (index) => HomePageCampaignHolder(
                              index: index,
                              id: campaign.campaignIds[index]["documentId"],
                            )),
                  ),
                ),
              ),
            );
          }),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Try it now !!",
              style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EcobotPage()));
            },
            child: Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 0.6, color: Colors.grey.shade300),
                  gradient: LinearGradient(colors: [
                    Color(0xFFBFF4BE),
                    Color(0xFFD6F6D5),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Got questions?",
                          style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Ask our ",
                            style: TextStyle(fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: "Gemini AI ",
                            style: TextStyle(fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "powered\n",
                            style: TextStyle(fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: "Ecobot  →",
                            style: TextStyle(fontSize: 18, height: 26 / 18, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w700),
                          ),
                        ])),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset("images/chatbot.png")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Content. Just for you !",
              style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 150,
                child: Row(
                  children: List.generate(
                      mixedUrls.length,
                      (i) => Container(
                            margin: EdgeInsets.fromLTRB(0, 0, i != mixedUrls.length - 1 ? 12 : 0, 8),
                            width: MediaQuery.of(context).size.width - 100,
                            child: AnyLinkPreview(
                              link: mixedUrls[i],
                              bodyMaxLines: 3,
                              bodyTextOverflow: TextOverflow.ellipsis,
                              titleStyle:
                                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, height: 20 / 14, fontFamily: "Poppins"),
                              bodyStyle: TextStyle(color: Colors.grey, fontSize: 12, height: 16 / 12, fontFamily: "Poppins"),
                              errorBody: 'Unable to fetch data',
                              errorTitle: "It's me, I am the problem",
                              errorWidget: Container(
                                color: Colors.grey[300],
                                child: Text('Oops!'),
                              ),
                              errorImage: "https://google.com/",
                              backgroundColor: Colors.white,
                              borderRadius: 12,
                              removeElevation: false,
                              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.08))],
                              onTap: () async {
                                await launchUrl(Uri.parse(mixedUrls[i]), mode: LaunchMode.inAppWebView);
                              },
                            ),
                          )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Sustainability\nFor The Win",
              style: TextStyle(
                  fontSize: 42, height: 50 / 42, fontFamily: "PangeaAfrikanTrial", color: Colors.grey.shade300, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Image.asset(
            "images/home_last_illustration.jpeg",
            width: double.infinity,
          )
        ],
      ),
    ));
  }
}

class HomePageCampaignHolder extends StatefulWidget {
  final int index;
  final String id;
  const HomePageCampaignHolder({
    super.key,
    required this.index,
    required this.id,
  });

  @override
  State<HomePageCampaignHolder> createState() => _HomePageCampaignHolderState();
}

class _HomePageCampaignHolderState extends State<HomePageCampaignHolder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onLoad();
    });
  }

  onLoad() async {
    await CampaignController().getCampaignById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CampaignMap>(builder: (context, map, ch) {
      Campaign? campaign = map.campaigns[widget.id];
      return InkWell(
        onTap: () {
          if (campaign != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CampaignDetailPage(
                          id: campaign.id,
                        )));
          }
        },
        child: Container(
          height: 150,
          margin: EdgeInsets.only(right: widget.index == 4 ? 0 : 12),
          width: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), border: Border.all(width: 0.6, color: Colors.grey.shade300), color: Colors.white),
          child: campaign == null
              ? Center(child: CircularProgressIndicator())
              : Row(
                  children: [
                    Container(
                      height: 150,
                      width: 70,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                        child: Image.asset(
                          "images/carbon_portrait.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            campaign.campaignName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Organised by ",
                              style: TextStyle(
                                  fontSize: 12, height: 16 / 12, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: campaign.orgName,
                              style: TextStyle(
                                  fontSize: 12, height: 16 / 12, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w600),
                            ),
                          ])),
                          SizedBox(
                            height: 12,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Carbon Credits to be earned: ",
                              style: TextStyle(
                                  fontSize: 12, height: 16 / 12, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: "${campaign.carbonCredits}",
                              style: TextStyle(
                                  fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w600),
                            ),
                          ])),
                          SizedBox(
                            height: 8,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "Amount Raised  ",
                              style: TextStyle(
                                  fontSize: 12, height: 16 / 12, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: "${campaign.amountCollected} / ${campaign.totalAmount} INR",
                              style: TextStyle(
                                  fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade800, fontWeight: FontWeight.w600),
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
                                  width: constraints.maxWidth * (campaign.amountCollected / campaign.totalAmount),
                                  decoration: BoxDecoration(color: colorGreen1, borderRadius: BorderRadius.circular(20)),
                                )
                              ],
                            );
                          })
                        ],
                      ),
                    ))
                  ],
                ),
        ),
      );
    });
  }
}

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.6, color: Colors.grey.shade300),
          gradient: LinearGradient(colors: [Color(0xFFE4FDE1), Color(0xFFEFFDEE)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "images/wave_qr_background.png",
                color: Colors.black.withOpacity(0.025),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Carbon Offsets",
                  style: TextStyle(fontSize: 22, height: 30 / 22, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "00.00",
                  style: TextStyle(fontSize: 32, height: 40 / 32, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(width: 0.4, color: Colors.grey.shade600)),
                      child: Text(
                        "More credits",
                        style: TextStyle(fontSize: 14, height: 22 / 14, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(width: 0.4, color: Colors.grey.shade600)),
                      child: Text(
                        "See Ledger",
                        style: TextStyle(fontSize: 14, height: 22 / 14, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
