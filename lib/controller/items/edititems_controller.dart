import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/functions/uploadfile.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/categories/viewcategoriesdata.dart';
import 'package:ecommerceadmin/data/datasource/remote/items/edititemsdata.dart';
import 'package:ecommerceadmin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditItemsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  EditItemsData editItemsData = EditItemsData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  List<CategoriesModel> categories = [];
  ViewCategoriesData catData = ViewCategoriesData(Get.find());
  List<SelectedListItem> dropdownlist = [];

  late String name;
  late String namear;
  late String desc;
  late String descar;
  late String count;
  late String price;
  late String discount;
  late String catname;
  late String catid;
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController descController;
  late TextEditingController descarController;
  late TextEditingController countController;
  late TextEditingController priceController;
  late TextEditingController discountController;
  late TextEditingController catnameController;
  late TextEditingController catidController;
  late String oldimage = Get.arguments['image'];
  File? file;

  void initialData() {
    name = Get.arguments['name'];
    namear = Get.arguments['namear'];
    desc = Get.arguments['desc'];
    descar = Get.arguments['descar'];
    count = Get.arguments['count'];
    price = Get.arguments['price'];
    discount = Get.arguments['discount'];
    catname = Get.arguments['catname'];
    catid = Get.arguments['catid'];
    nameController = TextEditingController();
    nameArController = TextEditingController();
    descController = TextEditingController();
    descarController = TextEditingController();
    countController = TextEditingController();
    priceController = TextEditingController();
    discountController = TextEditingController();
    catnameController = TextEditingController();
    catidController = TextEditingController();
    nameController.text = name;
    nameArController.text = namear;
    descController.text = desc;
    descarController.text = descar;
    countController.text = count;
    priceController.text = price;
    discountController.text = discount;
    catnameController.text = catname;
    catidController.text = catid;
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(true);
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  editItems() async {
    var response;
    statusRequest = StatusRequest.loading;
    update();
    if (file == null) {
      response = await editItemsData.editData(
          Get.arguments['id'],
          nameController.text,
          nameArController.text,
          descController.text,
          descarController.text,
          countController.text,
          priceController.text,
          discountController.text,
          catidController.text,
          Get.arguments['image']); // Update variable names
    } else {
      response = await editItemsData.editDataWithFile(
          Get.arguments['id'],
          nameController.text,
          nameArController.text,
          descController.text,
          descarController.text,
          countController.text,
          priceController.text,
          discountController.text,
          catidController.text,
          Get.arguments['image'],
          file!);
    }

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.items); // Update route
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    initialData(); // Update method name
    super.onInit();
  }
}
