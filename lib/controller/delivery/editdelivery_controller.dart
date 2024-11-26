import 'dart:io';

import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/delivery/deliverydata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditDeliveryController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  DeliveryData deliveryData = DeliveryData(Get.find());

  MyServices myServices = Get.find();

  late String name;
  late String email;
  late String password;
  late String phone;

  TextEditingController? namecontroller;
  TextEditingController? emailcontroller;
  TextEditingController? passwordcontroller;
  TextEditingController? phonecontroller;
  File? file;

  intialData() {
    name = Get.arguments['name'];
    email = Get.arguments['email'];
    password = Get.arguments['password'];
    phone = Get.arguments['phone'];
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    phonecontroller = TextEditingController();
    namecontroller!.text = name;
    emailcontroller!.text = email;
    passwordcontroller!.text = password;
    phonecontroller!.text = phone;
  }

  editdelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deliveryData.editData(
        Get.arguments['id'],
        namecontroller!.text,
        passwordcontroller!.text,
        emailcontroller!.text,
        phonecontroller!.text);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.deliveryview);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
