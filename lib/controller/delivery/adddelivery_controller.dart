import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/delivery/deliverydata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddDeliveryController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  DeliveryData deliveryData = DeliveryData(Get.find());

  MyServices myServices = Get.find();
  bool isshowpassword = true;

  TextEditingController? name;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? phone;

  intialData() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  addDelivery() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await deliveryData.addData(
        name!.text, password!.text, email!.text, phone!.text);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.deliveryview);
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
