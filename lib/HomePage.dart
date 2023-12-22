// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:too_heal/Drawer.dart';
import 'package:too_heal/Routes/Routes.dart';
import 'package:too_heal/ToohealController.dart';

import 'Contactdetail.dart';

class HomePage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final ToohealItem = Get.put(ToohealController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Too Heal",
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ToohealItem.tooHeal.length,
                  itemBuilder: (c, i) {
                    var data = ToohealItem.tooHeal.value[i];
                    var contactdetail = ToohealItem.tooHeal.value[i].detail;
                    return InkWell(
                      onTap: () {
                        Get.toNamed(RoutesClasss.detail,
                            arguments: {"detail": contactdetail});
                      },
                      child: Card(
                        child: ListTile(
                          trailing: Icon(Icons.phone),
                          title: Text(data.name.toString()),
                          subtitle: Text(data.number.toString()),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(data.picture.toString()),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
