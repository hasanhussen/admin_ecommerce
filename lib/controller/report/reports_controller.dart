import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/report/reportsdata.dart';
import 'package:ecommerceadmin/data/model/reportmodel.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  ReportData reportData = ReportData(Get.find());

  List<ReportModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await reportData.getData();

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ReportModel.fromJson(e)));
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
