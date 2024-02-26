import 'package:dio/dio.dart';
import 'package:ecostrider/controllers/requestService.dart';
import 'package:ecostrider/pages/loginPage.dart';
import 'package:ecostrider/pages/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> userSignup(String name, String email, String password, String gender, String phone, BuildContext context) async {
    try {
      UserCredential? newUser = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (newUser.user != null) {
        Response resp = await NetworkOptions.instance.postReq(url: "https://ecostride-backend.vercel.app/user/signup", data: {
          "firstName": name.split(" ").first,
          "lastName": name.split(" ").last,
          "phone": phone,
          "gender": gender.toLowerCase(),
          "email": email,
          "password": password,
          "userId": newUser.user!.uid
        });
        if (resp.data != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationScreen()));
        } else {
          return;
        }
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? "Something went wrong", gravity: ToastGravity.BOTTOM);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong", gravity: ToastGravity.BOTTOM);
    }
  }

  Future<void> userLogin(BuildContext context) async {
    User? currentUser = auth.currentUser;
    if (currentUser != null) {
      String userEmail = currentUser.email ?? "";
      if (userEmail.isNotEmpty) {
        Response resp = await NetworkOptions.instance.getReq(url: "https://ecostride-backend.vercel.app/user/$userEmail");
        if (resp.data != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationScreen()));
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
