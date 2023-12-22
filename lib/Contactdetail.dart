import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_heal/TooHeal.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactdetail extends StatelessWidget {
  List<Detail> detail;

  Contactdetail({super.key, required this.detail});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.green,
        title: Container(
          alignment: Alignment.center,
          child: Text("Contact Detail"),
        ),
      ),
      body: ListView.builder(
        itemCount: detail.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(
                detail[index].picture.toString(),
                height: 400,
                fit: BoxFit.fitWidth,
              ),
              Container(
                child: Text(
                  "Name :  " + detail[index].name.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Phone Number:  " + detail[index].number.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Icon(Icons.phone),
                    onTap: () {
                      launchUrl(Uri(
                          scheme: 'tel',
                          path: detail[index].number.toString()));
                    },
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
