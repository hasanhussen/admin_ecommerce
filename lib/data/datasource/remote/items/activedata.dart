import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class ActiveItemsData {
  Crud crud;
  ActiveItemsData(this.crud);

  activeData(String id, String active) async {
    var response = await crud.postData(AppLink.activeitems, {
      'id': id,
      'active': active,
    });
    return response.fold((l) => l, (r) => r);
  }
}
