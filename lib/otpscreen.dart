import "dart:developer";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:too_heal/HomePage.dart";
import "package:too_heal/Routes/Routes.dart";

class otpscreen extends StatefulWidget {
  String verificationId;

  otpscreen({super.key, required this.verificationId});

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  TextEditingController optController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter OTP",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: optController,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationId,
                            smsCode: optController.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then(
                        (value) =>
                            Get.offAllNamed(RoutesClasss.getHomeRoute()));
                  } catch (ex) {
                    log(ex.toString());
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
