import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'dart:convert';

import 'package:dio/dio.dart' as Dio;

import 'TooHeal.dart';

class ToohealController extends GetxController {
  var tooHeal = <TooHeal>[].obs;
  var loading = true.obs;

  Future<void> getData() async {
    loading.value = true;
    String url = "https://backendwork-subhagyaborus.onrender.com/gettooheal";

    try {
      Dio.Dio dio = Dio.Dio(); // Initialize Dio instance using the prefix
      Dio.Response response = await dio.get(url); // Use the Response from Dio

      if (response.statusCode == 200) {
        var responseData = json.decode(response.data);
        tooHeal.value = List<TooHeal>.from(
          responseData.map((x) => TooHeal.fromJson(x)),
        );
        loading.value = false;
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
