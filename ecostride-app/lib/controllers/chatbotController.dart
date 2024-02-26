// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:dio/dio.dart';
import 'package:ecostrider/controllers/requestService.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatbotController {
  Future<String> getAnswer(String question) async {
    try {
      String apiKey = "AIzaSyBYpXcpE0tY2mKF6QsnN14rjKydhgftqnQ";
      final String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey";
      Map<dynamic, dynamic> data = {
        "contents": [
          {
            "parts": [
              {
                "text":
                    "You are an environmentalist who has been working towards carbon offsets and carbon credits. You have given many speeches and talks on how to reduce carbon emissions from the environment. Now your job is to answer queries in very simple terms which is understandable to a layman and remember you only have to take up questions that are related to carbon offsets, carbon credits, carbon emissions, clean energy, green energy and ignore or deny answering rest all of the questions without revealing your identity and be polite to user. So now please help me understand,$question"
              }
            ],
          },
        ],
        "generationConfig": {"temperature": 0.9, "maxOutputTokens": 400, "topP": 0.8, "topK": 10},
      };
      Response response = await NetworkOptions.instance.postReq(url: url, data: data);

      if (response.data.isNotEmpty) {
        if (response.data["candidates"] != null) {
          if (response.data["candidates"].isNotEmpty) {
            if (response.data["candidates"][0]["content"] != null) {
              if (response.data["candidates"][0]["content"]["parts"] != null) {
                if (response.data["candidates"][0]["content"]["parts"].isNotEmpty) {
                  if (response.data["candidates"][0]["content"]["parts"][0]["text"] != null) {
                    return response.data["candidates"][0]["content"]["parts"][0]["text"];
                  }
                }
              }
            }
          }
        }
      }
      return "🫣 Unable to fetch answer";
    } on DioException catch (_) {
      Fluttertoast.showToast(
        msg: "Something went wong.",
        gravity: ToastGravity.BOTTOM,
      );
      return "🫣 Unable to fetch answer";
    }
  }
}
