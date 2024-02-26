// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecostrider/constants.dart';
import 'package:ecostrider/controllers/requestService.dart';
import 'package:ecostrider/controllers/userController.dart';
import 'package:ecostrider/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Join the Cult today.",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "PangeaAfrikanTrial",
                                    height: 32 / 24,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Center(
                              child: Text(
                                "Take a step towards sustainability today,\nEnjoy the benefits lifelong.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "PangeaAfrikanTrial",
                                    height: 22 / 16,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Divider(
                                  height: 0,
                                  thickness: 1,
                                  color: Colors.grey.shade200,
                                )),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Few Info Please",
                                  style: TextStyle(fontSize: 16, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Divider(
                                  height: 0,
                                  thickness: 1,
                                  color: Colors.grey.shade200,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text("Name 🗓️",
                                style: TextStyle(
                                    fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 0.4, color: Colors.grey.shade400)),
                              child: TextField(
                                controller: nameController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: "Eg. John Doe",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        height: 24 / 16,
                                        fontFamily: "Poppins",
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none),
                                keyboardType: TextInputType.name,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-z ]"))],
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text("Phone ☎️",
                                style: TextStyle(
                                    fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 0.4, color: Colors.grey.shade400)),
                              child: TextField(
                                controller: phoneController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: "Eg. 1234567890",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        height: 24 / 16,
                                        fontFamily: "Poppins",
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none),
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text("Gender 🧬",
                                style: TextStyle(
                                    fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 0.4, color: Colors.grey.shade400)),
                              child: TextField(
                                controller: genderController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: "Eg. Male/Female/Non Binary",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        height: 24 / 16,
                                        fontFamily: "Poppins",
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none),
                                keyboardType: TextInputType.name,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-z]"))],
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text("Email ✉️",
                                style: TextStyle(
                                    fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 0.4, color: Colors.grey.shade400)),
                              child: TextField(
                                controller: emailController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: "Eg. trap@ecostrider.in",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        height: 24 / 16,
                                        fontFamily: "Poppins",
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none),
                                keyboardType: TextInputType.emailAddress,
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-z0-9.@]"))],
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text("Password 👀",
                                style: TextStyle(
                                    fontSize: 14, height: 20 / 14, fontFamily: "Poppins", color: Colors.grey.shade600, fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(width: 0.4, color: Colors.grey.shade400)),
                              child: TextField(
                                controller: passwordController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none),
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "By proceeding, you agree to our ",
                                    style: TextStyle(
                                        fontSize: 12, height: 16 / 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: "Terms & Conditions ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        height: 16 / 12,
                                        fontFamily: "Poppins",
                                        color: Colors.indigoAccent,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: "and ",
                                    style: TextStyle(
                                        fontSize: 12, height: 16 / 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                        fontSize: 12,
                                        height: 16 / 12,
                                        fontFamily: "Poppins",
                                        color: Colors.indigoAccent,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ])),
                            SizedBox(
                              height: 24,
                            ),
                            PrimaryButton(
                              isValid: nameController.text.isNotEmpty &&
                                  emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty &&
                                  phoneController.text.isNotEmpty &&
                                  genderController.text.isNotEmpty &&
                                  phoneController.text.length == 10,
                              text: "Let's Go",
                              height: 56,
                              backgroundColor: colorGreen1,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                await UserController().userSignup(nameController.text, emailController.text, passwordController.text,
                                    genderController.text, phoneController.text, context);
                              },
                            ),
                            SizedBox(
                              height: 24,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
