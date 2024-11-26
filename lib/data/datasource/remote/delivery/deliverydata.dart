import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class DeliveryData {
  Crud crud;
  DeliveryData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.deliveryView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(String name, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.deliveryAdd, {
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String deliveryid, String name, String password, String email,
      String phone) async {
    var response = await crud.postData(AppLink.deliveryEdit, {
      "deliveryid": deliveryid,
      "name": name,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String deliveryid) async {
    var response =
        await crud.postData(AppLink.deliveryDelete, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }
}
