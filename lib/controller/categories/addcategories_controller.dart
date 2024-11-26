import 'dart:io';

import 'package:ecommerceadmin/controller/categories/viewcategories_controller.dart';
import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/uploadfile.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/categories/addcategoriesdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCategoriesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddCategoriesData addcatData = AddCategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  late TextEditingController name;
  late TextEditingController namear;
  File? file;

  intialData() {
    name = TextEditingController();
    namear = TextEditingController();
  }

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addCategories() async {
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar('Warning', 'Please choose Image SVG');
        return;
      }
      statusRequest = StatusRequest.loading;
      update();

      var response = await addcatData.addData(name.text, namear.text, file!);

      print("=============================== Controller $response ");

      response.fold(
        (failure) {
          // Handle failure case
          statusRequest = StatusRequest.serverfailure; // Handle server failure
          update();
        },
        (responseData) {
          // Handle success case
          statusRequest = StatusRequest.success;

          if (responseData['status'] == "success") {
            Get.offNamed(AppRoute.categories);
            CategoriesController c = Get.find();
            c.getCategories();
          } else {
            statusRequest = StatusRequest.failure;
          }
          update();
        },
      );
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
