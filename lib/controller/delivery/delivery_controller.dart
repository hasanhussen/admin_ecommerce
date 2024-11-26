import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/delivery/deliverydata.dart';
import 'package:ecommerceadmin/data/model/deliverymodel.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {
  DeliveryData deliveryData = DeliveryData(Get.find());

  List<DeliveryModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  deletedelivery(String deliveryid) {
    deliveryData.deleteData(deliveryid);
    data.removeWhere((element) => element.deliveryId == deliveryid);
    update();
  }

  gotoedit(
      String id, String name, String email, String password, String phone) {
    Get.toNamed(AppRoute.deliveryedit, arguments: {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await deliveryData.getData();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => DeliveryModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
