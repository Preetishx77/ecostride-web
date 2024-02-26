// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names
import 'package:any_link_preview/any_link_preview.dart';
import 'package:ecostrider/constants.dart';
import 'package:ecostrider/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Want to learn about\n",
                style: TextStyle(fontSize: 26, height: 34 / 26, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "Carbon Emissions?",
                style: TextStyle(fontSize: 30, height: 38 / 30, fontFamily: "PangeaAfrikanTrial", color: colorGreen1, fontWeight: FontWeight.w600),
              ),
            ])),
            SizedBox(
              height: 12,
            ),
            Text(
                "We have handpicked some of the best available resources in the internet to help you achieve your knwoledge about Carbon Sustainability faster",
                style: TextStyle(fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 26,
            ),
            Text(
              "Blogs",
              style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16,
            ),
            for (int i = 0; i < blogUrls.length; i++) ...{
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: AnyLinkPreview(
                  link: blogUrls[i],
                  bodyMaxLines: 3,
                  bodyTextOverflow: TextOverflow.ellipsis,
                  titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, height: 20 / 14, fontFamily: "Poppins"),
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
                    await launchUrl(Uri.parse(blogUrls[i]), mode: LaunchMode.inAppWebView);
                  },
                ),
              )
            },
            SizedBox(
              height: 24,
            ),
            Text(
              "Videos",
              style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16,
            ),
            for (int i = 0; i < videoUrls.length; i++) ...{
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: AnyLinkPreview(
                  link: videoUrls[i],
                  bodyMaxLines: 3,
                  bodyTextOverflow: TextOverflow.ellipsis,
                  titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, height: 20 / 14, fontFamily: "Poppins"),
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
                    await launchUrl(Uri.parse(videoUrls[i]), mode: LaunchMode.inAppWebView);
                  },
                ),
              )
            },
          ],
        ),
      ),
    );
  }
}
