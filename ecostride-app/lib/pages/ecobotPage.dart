//
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/controllers/chatbotController.dart';
import 'package:ecostrider/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EcobotPage extends StatelessWidget {
  final ChatbotController controller = ChatbotController();
  EcobotPage({super.key});

  TextEditingController questionController = TextEditingController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  String answerText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
        child: ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (context, load, ch) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Curious about\n",
                      style: TextStyle(
                          fontSize: 24, height: 32 / 24, fontFamily: "PangeaAfrikanTrial", color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "Carbon Footprints?",
                      style:
                          TextStyle(fontSize: 32, height: 40 / 32, fontFamily: "PangeaAfrikanTrial", color: colorGreen1, fontWeight: FontWeight.w700),
                    ),
                  ])),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Ecobot is here for the rescue.",
                    style: TextStyle(fontSize: 16, height: 24 / 16, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Top Questions",
                    style: TextStyle(fontSize: 20, height: 28 / 20, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  for (int i = 0; i < topQuestions.length; i++) ...{
                    GestureDetector(
                      onTap: () async {
                        isLoading.value = true;
                        answerText = await controller.getAnswer(topQuestions[i]);
                        isLoading.value = false;
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "${i + 1}. ",
                            style:
                                TextStyle(fontSize: 12, height: 16 / 12, fontFamily: "Poppins", color: Colors.black87, fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: topQuestions[i],
                            style:
                                TextStyle(fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.black87, fontWeight: FontWeight.w400),
                          ),
                        ])),
                      ),
                    )
                  },
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(width: 0.4, color: Colors.grey.shade300)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "images/chatbot.png",
                                  height: 24,
                                  width: 24,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Ecobot says",
                                  style: TextStyle(
                                      fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            load
                                ? SpinKitChasingDots(
                                    size: 20,
                                    color: Colors.grey..shade800,
                                  )
                                : MarkdownBody(
                                    data: answerText,
                                    selectable: false,
                                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                                        textAlign: WrapAlignment.start,
                                        unorderedListAlign: WrapAlignment.start,
                                        orderedListAlign: WrapAlignment.start,
                                        listBulletPadding: EdgeInsets.only(right: 10),
                                        codeblockPadding: EdgeInsets.zero,
                                        blockquotePadding: EdgeInsets.zero,
                                        pPadding: EdgeInsets.symmetric(vertical: 12),
                                        listIndent: 6,
                                        listBullet: TextStyle(fontSize: 14, height: 20 / 14, color: Colors.black, fontWeight: FontWeight.w700),
                                        p: TextStyle(fontSize: 14, height: 20 / 14, color: Colors.black, fontWeight: FontWeight.w400),
                                        a: TextStyle(fontSize: 14, height: 20 / 14, color: Colors.black, fontWeight: FontWeight.w400)),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 0.4, color: Colors.grey.shade300)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TextField(
                          controller: questionController,
                          enabled: !load,
                          maxLength: 240,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            isDense: true,
                            counter: Offstage(),
                            hintText: "Your query",
                            hintStyle: TextStyle(
                                fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade400, fontWeight: FontWeight.w400),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          ),
                        )),
                        SizedBox(
                          width: 8,
                        ),
                        load
                            ? SpinKitFadingCircle(
                                size: 20,
                                color: Colors.black,
                              )
                            : GestureDetector(
                                onTap: () async {
                                  isLoading.value = true;
                                  answerText = await controller.getAnswer(questionController.text);
                                  isLoading.value = false;
                                },
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                ),
                              )
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
