import 'dart:io';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerceadmin/controller/items/viewitems_controller.dart';
import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/functions/uploadfile.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/categories/viewcategoriesdata.dart';
import 'package:ecommerceadmin/data/datasource/remote/items/additemsdata.dart';
import 'package:ecommerceadmin/data/model/categoriesmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddItemsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddItemsData addItemsData = AddItemsData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  List<CategoriesModel> categories = [];
  ViewCategoriesData catData = ViewCategoriesData(Get.find());
  List<SelectedListItem> dropdownlist = [];

  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController catname;
  late TextEditingController catid;
  File? file;

  void intialData() {
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catname = TextEditingController();
    catid = TextEditingController();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(true);
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  // void showDropdownSearch(BuildContext context) {
  //   DropDownState(DropDown(
  //     data: dropdownlist ?? [],
  //     selectedItems: (List<dynamic> selectedList) {
  //       SelectedListItem selectedListItem = selectedList[0];
  //       catname.text = selectedListItem.name;
  //       catid.text = selectedListItem.value!;
  //     },
  //   )).showModal(context);
  // }

  getCategories() async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    var response = await catData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        categories.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));

        for (int i = 0; i < categories.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: categories[i].categoriesName!,
              value: categories[i].categoriesId!));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  addItems() async {
    // Update method name
    if (formState.currentState!.validate()) {
      if (file == null) {
        Get.snackbar('Warning', 'Please choose Image SVG');
        return;
      }
      statusRequest = StatusRequest.loading;
      update();

      var response = await addItemsData.addData(
          name.text,
          namear.text,
          file!,
          desc.text,
          descar.text,
          count.text,
          price.text,
          discount.text,
          '2'); // Update method call

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
            Get.offNamed(AppRoute.items); // Update route
            ItemsController c = Get.find(); // Update controller
            c.getItems(); // Update method call
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
    getCategories();
    super.onInit();
  }
}
