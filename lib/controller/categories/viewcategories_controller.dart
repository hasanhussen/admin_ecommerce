import 'package:ecommerceadmin/core/class/statusrequest.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/functions/handingdatacontroller.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/data/datasource/remote/categories/deletcategories.dart';
import 'package:ecommerceadmin/data/datasource/remote/categories/viewcategoriesdata.dart';
import 'package:ecommerceadmin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  List<CategoriesModel> categories = [];

  ViewCategoriesData catData = ViewCategoriesData(Get.find());
  DeleteCategoriesData deleteCategoriesData = DeleteCategoriesData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  gotoedit(String id, String name, String namear, String image) {
    Get.offNamed(AppRoute.editcategories,
        arguments: {'id': id, 'name': name, 'namear': namear, 'image': image});
  }

  gotoadd() {
    Get.offNamed(AppRoute.addcategories);
  }

  deleteCategories(String id, String imagename) async {
    var response = await deleteCategoriesData.deleteData(id, imagename);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        categories.removeWhere((element) => element.categoriesId == id);
        Get.back();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  myback() {
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }

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
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
