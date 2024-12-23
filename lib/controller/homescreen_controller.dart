import 'dart:convert';

import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  String? lang;
  String accessToken = "";
  int currentpage = 0;

  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
          'assets/ecommerce-d4136-firebase-adminsdk-969x0-00fad52f32.json');
      final accountCredentials = ServiceAccountCredentials.fromJson(
        json.decode(serviceAccountJson),
      );
      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      final client = http.Client();
      try {
        final accessCredentials =
            await obtainAccessCredentialsViaServiceAccount(
          accountCredentials,
          scopes,
          client,
        );
        accessToken = accessCredentials.accessToken.data;
        print('Access Token: $accessToken');
      } catch (e) {
        print('Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      print('Error loading service account JSON: $e');
    }
  }

  @override
  void onInit() {
    initialData();
    getAccessToken();
    super.onInit();
  }

  List bottomappbar = [
    {"title": "pending", "icon": Icons.timer_outlined},
    {"title": "approved", "icon": Icons.check},
    {"title": "archive", "icon": Icons.archive_outlined},
  ];

  List homecontainerlist = [
    {
      "title": "Categories",
      "image": 'categories.png',
      "ontap": () {
        Get.toNamed(AppRoute.categories);
      }
    },
    {
      "title": "Product",
      "image": 'product.png',
      "ontap": () {
        Get.toNamed(AppRoute.items);
      }
    },
    {
      "title": "Users",
      "image": 'users.png',
      "ontap": () {
        Get.toNamed(AppRoute.deliveryview);
      }
    },
    {
      "title": "Orders",
      "image": 'order.png',
      "ontap": () {
        Get.toNamed(AppRoute.ordershome);
      }
    },
    {
      "title": "Report",
      "image": 'report.png',
      "ontap": () {
        Get.toNamed(AppRoute.report);
      }
    },
    {
      "title": "Notification",
      "image": 'notification.png',
      "ontap": () {
        Get.toNamed(AppRoute.notification);
      }
    }
  ];

  @override
  changePage(i) {
    currentpage = i;
    update();
  }

  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("delivery");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
