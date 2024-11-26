import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/notification/notification_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  late TextEditingController titlenotification;
  late TextEditingController bodynotification;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.getData();

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  sendnotification(String title, String body) async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.sendtousers(title, body);

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.snackbar('success', 'The notification has been sent successfully',
          icon: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )));
      // End
    }
    update();
  }

  @override
  void onInit() {
    titlenotification = TextEditingController();
    bodynotification = TextEditingController();
    getData();
    super.onInit();
  }
}
