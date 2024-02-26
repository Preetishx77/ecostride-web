// ignore: file_names
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecostrider/controllers/requestService.dart';
import 'package:ecostrider/data/campaignModel.dart';
import 'package:ecostrider/widgets/enter_amount_bottom_sheet.dart';
import 'package:ecostrider/widgets/payment_success_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CampaignController {
  Future<void> getAllCampaigns() async {
    try {
      String url = "https://ecostride-backend.vercel.app/user/campaigns";
      Response response = await NetworkOptions.instance.getReq(url: url);
      CampaignMap.instance.setCampaignList(response.data["campaigns"]);
    } on DioException catch (_) {
      Fluttertoast.showToast(
        msg: "Something went wong.",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Future<void> getCampaignById(String id) async {
    String url = "https://ecostride-backend.vercel.app/user/campaigns/$id";

    try {
      Response response = await NetworkOptions.instance.getReq(url: url);
      CampaignMap.instance.addToMap(response.data["campaign"]);
    } on DioException catch (_) {
      Fluttertoast.showToast(
        msg: "Something went wong.",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  final Razorpay _razorpay = Razorpay();

  showEnterAmountBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => const AddAmountBottomSheet());
  }

  createPayment(double amount, BuildContext context) async {
    Map<String, dynamic> paymentData = {
      'amount': amount * 100, // amount in paise (e.g., 1000 paise = Rs. 10)
      'currency': 'INR',
      'receipt': 'order_receipt',
      'payment_capture': '1',
    };
    await initiatePayment(context, paymentData);
  }

  showDialogBottomSheet(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(context: context, builder: (context) => const PaymentSuccessBottomSheet(), isDismissible: false);
  }

  Future<void> initiatePayment(
    BuildContext context,
    Map<String, dynamic> paymentData,
  ) async {
    try {
      String apiUrl = 'https://api.razorpay.com/v1/orders';
      String rzpKey = const String.fromEnvironment("RZP_API_KEY");
      String rzpSecret = const String.fromEnvironment("RZP_SECRET");

      Response response = await Dio(BaseOptions(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ${base64Encode(utf8.encode('$rzpKey:$rzpSecret'))}',
      })).post(
        apiUrl,
        data: jsonEncode(paymentData),
      );

      if (response.statusCode == 200) {
        var responseData = response.data;
        String orderId = responseData['id'];

        var options = {
          'key': rzpKey,
          'amount': paymentData['amount'],
          'name': 'Ecostride',
          'order_id': orderId,
          'prefill': {'contact': '9876543210', 'email': 'biz.binary404@gmail.com'},
        };

        _razorpay.open(options);
        // ignore: use_build_context_synchronously
        _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess(context));
        // ignore: use_build_context_synchronously
        _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse(context));
        // ignore: use_build_context_synchronously
        _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected(context));
      } else {
        // Handle error response

        Fluttertoast.showToast(
          msg: "${response.data}",
          gravity: ToastGravity.BOTTOM,
        );
      }
    } on DioException catch (_) {
      Fluttertoast.showToast(
        msg: "Something went wong.",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  handlePaymentSuccess(BuildContext context) {
    _razorpay.clear();
    try {
      showDialogBottomSheet(context);
    } catch (e) {}
  }

  handlePaymentErrorResponse(BuildContext context) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
  }

  handleExternalWalletSelected(BuildContext context) {}
}
