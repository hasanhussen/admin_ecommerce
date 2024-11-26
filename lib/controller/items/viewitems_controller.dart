import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/items/activedata.dart';
import 'package:ecommerceadmin/data/datasource/remote/items/deletitems.dart';
import 'package:ecommerceadmin/data/datasource/remote/items/viewitemsdata.dart';
import 'package:ecommerceadmin/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  // Update class name
  List<ItemsModel> items = []; // Update variable name

  ViewItemsData itemsData = ViewItemsData(Get.find());
  ActiveItemsData activeItemsData = ActiveItemsData(Get.find());
  DeleteItemsData deleteItemsData =
      DeleteItemsData(Get.find()); // Update variable name

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    getItems(); // Update method call
    super.onInit();
  }

  gotoEdit(
      String id,
      String name,
      String namear,
      String desc,
      String descar,
      String count,
      String price,
      String discount,
      String catname,
      String catid,
      String image) {
    // Update method name
    Get.offNamed(AppRoute.edititems, // Update route
        arguments: {
          'id': id,
          'name': name,
          'namear': namear,
          'image': image,
          'desc': desc,
          'descar': descar,
          'count': count,
          'price': price,
          'discount': discount,
          'catname': catname,
          'catid': catid,
        });
  }

  gotoAdd() {
    // Update method name
    Get.offNamed(AppRoute.additems); // Update route
  }

  deleteItems(String id, String imagename) async {
    // Update method name
    var response =
        await deleteItemsData.deleteData(id, imagename); // Update method call
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        items.removeWhere(
            (element) => element.itemsId == id); // Update variable name
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  myBack() {
    // Update method name
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }

  getItems() async {
    // Update method name
    items.clear(); // Update variable name
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(); // Update method call
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        items.addAll(listdata
            .map((e) => ItemsModel.fromJson(e))); // Update variable name
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  activeitem(String id, String active) async {
    var response = await activeItemsData.activeData(id, active);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.back();
        getItems();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
