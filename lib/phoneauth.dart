import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_heal/Routes/Routes.dart';
import 'package:too_heal/otpscreen.dart';

class phoneauth extends StatelessWidget {
  TextEditingController _phoneauth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sigin In With Up Number",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _phoneauth,
                decoration: InputDecoration(
                    hintText: "Enter Phone Number..",
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.phone),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (phoneAuthCredential) {},
                      verificationFailed: (FirebaseAuthException ex) {},
                      codeSent: (String verificationId, int? resendtoken) {
                        Get.toNamed(RoutesClasss.getOtpscreenRoute(),
                            arguments: {"verificationId": verificationId});
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      phoneNumber: _phoneauth.text.toString());
                },
                child: Text("Verify Phone Number"))
          ],
        ),
      ),
    );
  }
} 
/*
Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => otpscreen(
                                verificationId: verificationId,
                              ),
                            ));  */