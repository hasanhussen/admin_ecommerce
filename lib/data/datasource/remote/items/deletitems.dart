import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class DeleteItemsData {
  Crud crud;
  DeleteItemsData(this.crud);
  deleteData(String id, String imagename) async {
    var response = await crud
        .postData(AppLink.deleteitems, {'id': id, 'imagename': imagename});
    return response.fold((l) => l, (r) => r);
  }
}
