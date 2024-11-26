import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class DeleteCategoriesData {
  Crud crud;
  DeleteCategoriesData(this.crud);
  deleteData(String id, String imagename) async {
    var response = await crud
        .postData(AppLink.deletecategories, {'id': id, 'imagename': imagename});
    return response.fold((l) => l, (r) => r);
  }
}
