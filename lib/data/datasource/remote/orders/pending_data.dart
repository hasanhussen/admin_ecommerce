import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.ordersview, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String ordersid, String usersid, String accessToken) async {
    var response = await crud.postData(AppLink.ordersapprove,
        {"ordersid": ordersid, "usersid": usersid, 'accessToken': accessToken});
    return response.fold((l) => l, (r) => r);
  }

  rejectData(String ordersid, String usersid, String accessToken) async {
    var response = await crud.postData(AppLink.ordersreject,
        {"ordersid": ordersid, "usersid": usersid, 'accessToken': accessToken});
    return response.fold((l) => l, (r) => r);
  }

  readyData(String ordersid, String usersid, String type) async {
    var response = await crud.postData(AppLink.ordersready,
        {"ordersid": ordersid, "usersid": usersid, 'ordertype': type});
    return response.fold((l) => l, (r) => r);
  }

  // sendnotification(String ordersid, String usersid, String type) async {
  //   var response = await crud.postData(AppLink.ordersnotification,
  //       {"ordersid": ordersid, "usersid": usersid, 'ordertype': type});
  //   return response.fold((l) => l, (r) => r);
  // }
}
