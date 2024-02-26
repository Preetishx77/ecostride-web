// ignore_for_file: prefer_const_constructors

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/controllers/campaignController.dart';
import 'package:ecostrider/controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onLoad();
    });
  }

  onLoad() async {
    isLoading.value = true;
    await CampaignController().getAllCampaigns();
    // ignore: use_build_context_synchronously
    await UserController().userLogin(context);
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image.asset("images/splash_bg.png"),
          Column(
            children: [
              Spacer(),
              Image.asset(
                "images/Ecostride.png",
                width: double.infinity,
              ),
              Spacer(),
              SizedBox(
                width: 280,
                child: Text(
                  "Sustainability can be Rewarding",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24, fontFamily: "PangeaAfrikanTrial", height: 32 / 24, color: Colors.grey.shade800, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (context, load, ch) {
                    return load
                        ? SpinKitDancingSquare(
                            size: 24,
                            color: colorGreen2,
                          )
                        : SizedBox();
                  }),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
