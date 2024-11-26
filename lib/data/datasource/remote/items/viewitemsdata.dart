import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class ViewItemsData {
  // Update class name
  Crud crud;
  ViewItemsData(this.crud); // Update constructor

  getData() async {
    var response = await crud.postData(AppLink.items, {}); // Update API link
    return response.fold((l) => l, (r) => r);
  }
}
