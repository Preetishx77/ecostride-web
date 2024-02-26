// ignore_for_file: prefer_const_constructors

import 'package:ecostrider/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(quarterTurns: 2, child: Image.asset("images/splash_bg.png")),
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF4F6F52).withOpacity(0.9),
              Color(0xFF739072).withOpacity(0.5),
              Color(0xFF86A789).withOpacity(0.2),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reforming\nSustainability",
                    style:
                        TextStyle(fontSize: 40, fontFamily: "PangeaAfrikanTrial", height: 48 / 40, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      "Pioneering the way people earn via sustainability",
                      style:
                          TextStyle(fontSize: 16, fontFamily: "Poppins", height: 22 / 16, color: Colors.grey.shade200, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        "Explore Now",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "PangeaAfrikanTrial",
                            height: 28 / 20,
                            color: Colors.grey.shade200,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              isDismissible: false,
                              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
                              builder: (context) => LoginBottomSheet());
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
