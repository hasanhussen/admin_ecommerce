import 'package:ecommerceadmin/controller/homescreen_controller.dart';
import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommerceadmin/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  HomeScreenControllerImp homeController = Get.find();
  List<OrdersModel> data = [];

  late StatusRequest statusRequest;
  String deliverytype = '';
  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      deliverytype = "delivery";
    } else {
      deliverytype = "Recive";
    }
    return deliverytype;
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  rejectOrder(String orderid, String usersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.rejectData(
        orderid, usersid, homeController.accessToken);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  approveOrders(String orderid, String usersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.approveData(
        orderid, usersid, homeController.accessToken);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  preparedOrders(String orderid, String usersid, String type) async {
    statusRequest = StatusRequest.loading;
    update();
    printOrderType(type);
    var response =
        await ordersPendingData.readyData(orderid, usersid, deliverytype);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
