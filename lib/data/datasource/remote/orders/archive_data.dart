import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.ordersarchive, {});
    return response.fold((l) => l, (r) => r);
  }
}
