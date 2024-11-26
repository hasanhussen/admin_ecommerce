import 'dart:io';

import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/functions/uploadfile.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/categories/editcategoriesdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditCategoriesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  EditCategoriesData editcatData = EditCategoriesData(Get.find());

  MyServices myServices = Get.find();

  late String name;
  late String namear;

  TextEditingController? namecontroller;
  TextEditingController? namearcontroller;
  File? file;

  intialData() {
    name = Get.arguments['name'];
    namear = Get.arguments['namear'];
    namecontroller = TextEditingController();
    namearcontroller = TextEditingController();
    namecontroller!.text = name;
    namearcontroller!.text = namear;
  }

  chooseImage() async {
    file = await fileUploadGallery(true);
  }

  editcategories() async {
    var response;
    statusRequest = StatusRequest.loading;
    update();
    if (file == null) {
      print(Get.arguments['id']);
      print(name);
      print(namear);
      print(Get.arguments['image']);
      response = await editcatData.editData(Get.arguments['id'],
          namecontroller!.text, namearcontroller!.text, Get.arguments['image']);
    } else {
      response = await editcatData.editDatawithfile(
          Get.arguments['id'],
          namecontroller!.text,
          namearcontroller!.text,
          Get.arguments['image'],
          file!);
    }

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.categories);
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
