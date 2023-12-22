import 'package:get/get.dart';
import 'package:too_heal/Contactdetail.dart';
import 'package:too_heal/otpscreen.dart';
import 'package:too_heal/phoneauth.dart';

import '../HomePage.dart';

class RoutesClasss {
  static String home = "/";
  static String detail = "/detail/";
  static String Phoneauth = "/phoneauth/";
  static String Otpscreen = "/otpscreen/";

  static String getHomeRoute() => home;
  static String getDetailRoute() => detail;
  static String getphoneauthRoute() => Phoneauth;
  static String getOtpscreenRoute() => Otpscreen;

  static List<GetPage> routes = [
    GetPage(
        name: Otpscreen,
        page: () => otpscreen(
              verificationId: Get.arguments['verificationId'],
            )),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: Phoneauth, page: () => phoneauth()),
    GetPage(
        name: detail,
        page: () => Contactdetail(
              detail: Get.arguments['detail'],
            ))
  ];
}
